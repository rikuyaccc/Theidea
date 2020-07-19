Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrarions: "users/registrations"
  }

  post "follow/:id" => "relationships#follow", as: "follow"
  post "unfollow/:id" => "relationships#unfollow", as: "unfollow"

  resources :users, only: [:show,:index]

  get '/' => "home#top"

  resources :posts

  resources :relationships, only: [:create, :destroy]



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
