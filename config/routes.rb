Rails.application.routes.draw do
  resources :articles
  root 'home#index'

  get 'home/about'
  get 'home/latest'
  get 'home/oldest'
  get 'home/contact'
  
  get 'blurbs/latest'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
