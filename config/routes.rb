Rails.application.routes.draw do
  get 'profiles/new'
  get 'signup' => 'users#new', as: 'signup'
  get 'login' => 'sessions#new', as: 'login'
  get 'logout' => 'sessions#delete', as: 'logout'
  get 'weather' => 'weather#show', as: 'get_weather'

  resources :users
  resources :posts
  resources :sessions

  root 'posts#index', as: 'home'
  get 'about' => 'pages#about', as: 'about'
end
