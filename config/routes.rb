Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#top'
  get 'home/about'
  resources :users
  resources :recipes do
    resources :recipe_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
end
