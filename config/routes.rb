Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/components', to: 'pages#components_gwen'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :food_items, only: [:show, :index]

  resources :recipes

  resources :reports do
    resources :report_food_items
    resources :report_moods
    resources :report_feelings
  end


end


# resources :moods, only: [:show, :index]
# resources :feeling, only: [:show, :index]
