Rails.application.routes.draw do
  mount Fluent::Engine => "/"

  match '/' => 'site#index', via: :all
end
