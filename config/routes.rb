Rails.application.routes.draw do
  resources :topics, only: [:index, :show]
  mount ActionCable.server => '/websocket'
  resources :comments
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :portfolios, except: [:show] do
    member do
      patch :move
    end
  end
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  get 'angular', to: 'portfolios#angular'
  
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'tech-news', to: 'pages#tech_news' 

  resources :blogs do
    member do
      get 'toggle_status'
    end
  end

  root to: 'pages#home'
end
