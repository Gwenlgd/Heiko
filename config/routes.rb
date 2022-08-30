Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :food_items, only: [:show, :index]

  resources :recipes
  resources :reports do
    resources :report_food_items, only: [:create]
    resources :report_moods, only: [:create]
    resources :report_feelings, only: [:create]
  end

  # resources :moods, only: [:show, :index]
  # resources :feeling, only: [:show, :index]

end


# resources :listings do
#   resources :rentals, except: [:edit, :update]
# end

# resources :rentals, only: [:show] do
#   resources :reviews, only: [:create, :new]
# end
