Rails.application.routes.draw do
  get 'coordinates/index'
  resources :posts
end
