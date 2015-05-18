class Fluent::NodeRouter
  def call env
    slug = env['action_dispatch.request.path_parameters'][:path]
    env['action_dispatch.request.path_parameters'][:id] = slug

    type = Fluent::Node.find_by(slug: slug).type

    controller = type[0..type.index('#')-1]
    action = type[type.index('#')+1..-1]
    controller_class= (controller + 'Controller').camelize.constantize
    controller_class.action(action.to_sym).call(env)
  end
end

Fluent::Engine.routes.draw do
  default_url_options format: :html

  # Routes
  # Backend
  namespace :admin do
    match '/' => 'blocks#index', via: :all
    resources :pages
    resources :news
    resources :blocks
    resources :users
    resources :roles
    resources :settings

    resources :menus
    resources :menu_items do
      collection do
        post 'change_order'
      end
    end
  end

  # CKEditor
  mount Ckeditor::Engine => '/ckeditor'

  # Devise
  devise_for :users, :path_names => {:sign_in => "login", :sign_out => "logout"}, :path => "user"

  # Nodes routes
  get '*path(.:format)', to: Fluent::NodeRouter.new,
     constraints: lambda { |request|
      format_pos = request.path.index('.') || 0
     Fluent::Node.where(slug: request.path[1..format_pos-1]).count > 0
  }, format: {}

end