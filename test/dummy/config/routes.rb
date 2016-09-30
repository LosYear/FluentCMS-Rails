Rails.application.routes.draw do

  root 'application#index', via: :all

  mount Fluent::Engine => "/"
end
