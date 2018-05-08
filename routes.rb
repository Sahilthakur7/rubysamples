
Rails.application.routes.draw do
  root to: 'pages#home'
  resources :portfolios, except: [:show]
  get 'portfolio/:id',to: 'portfolios#show',as: 'portfolio_show'
  resources :blogs do
      member do
          get :toggle_status
      end
  end

  resources :admin do
      get 'dashboard/main'
      get 'dashboard/user'
      get 'dashboard/blog'
  end

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'


  resources :posts

  get 'posts/*missing', to: 'posts#misssing'

  get 'query/:something', to: 'pages#something'
end
