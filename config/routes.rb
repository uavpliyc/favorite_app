Rails.application.routes.draw do

  get 'home/top'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#top"
  resource :user, except: [:new, :create, :destroy]
  resources :recipes
end
