Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/components', to: 'pages#components_gwen'
  get '/components1', to: 'pages#components_jules'
  get '/calendar', to: 'pages#calendar'
  get '/dashboard', to: 'pages#dashboard'
  get '/settings', to: 'pages#settings'
  get '/testlink', to: 'pages#testpageslink'
  get '/cancel', to: 'pages#cancel_account'
  get '/month', to: 'pages#month_report'
  get '/week', to: 'pages#week_report'

  # get '/new', to 'pages#new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :food_items, only: [:show, :index]

  resources :recipes

  resources :reports, except: [:index] do
    resources :report_food_items
    resources :report_moods
    resources :report_feelings
  end


end


# resources :moods, only: [:show, :index]
# resources :feeling, only: [:show, :index]
