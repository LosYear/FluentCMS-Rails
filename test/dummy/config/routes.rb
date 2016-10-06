Rails.application.routes.draw do
  match '/' => 'site#index', via: :all

  mount Fluent::Engine => "/"
end
