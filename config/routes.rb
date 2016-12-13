Rails.application.routes.draw do
  scope ':locale', locale: /#{I18n.available_locales.join("|")}/ do
    # get 'sessions/new'
    get 'en', to: 'application#locale_en', as: 'english'
    get 'ru', to: 'application#locale_ru', as: 'russian'

    root 'posts#index'
    get  '/help',    to: 'static_pages#help'
    get  '/about',   to: 'static_pages#about'
    get  '/contact', to: 'static_pages#contact'
    get  '/home', to: 'static_pages#home', as: 'home'

    get  '/signup',  to: 'users#new'
    get '/login',    to: 'sessions#new'
    post '/login',   to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'

    resources :users
    resources :posts do
      resources :comments do
        member do
          put 'like', to: 'comments#vote'
          put 'unlike', to: 'comments#downvote'
        end
      end
    end
  end

  get '*path', to: redirect("/#{I18n.default_locale}/%{path}")
  get '', to: redirect("/#{I18n.default_locale}")

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
