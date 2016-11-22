Rails.application.routes.draw do
  root 'static_pages#home'
  get 'static_pages/home'
  get 'static_pages/about'
  get 'static_pages/help'

  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }
  resources :posts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
