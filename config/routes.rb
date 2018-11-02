Rails.application.routes.draw do
  root 'posts#index', as: 'home'

  get 'profiles/new'
  get 'signup' => 'users#new', as: 'signup'
  get 'login' => 'sessions#new', as: 'login'
  get 'logout' => 'sessions#delete', as: 'logout'
  get 'weather' => 'weather#show', as: 'get_weather'
  get 'about' => 'pages#about', as: 'about'
  get 'terms' => 'pages#terms', as: 'terms'

  resources :users
  resources :posts
  resources :sessions
end
