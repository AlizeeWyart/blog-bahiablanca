Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  namespace :admin do
    get "/" => "dashboard#home"
    get "thematics" => "dashboard#categories"
    get "profile" => "dashboard#profile"
    get "regions" => "dashboard#regions"
    resources :category4as, only: [:create, :destroy]
    resources :region4as, only: [:create, :destroy]
    resources :regions, only: [:update]
    resources :articles, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :contents, only: [:new, :create, :update]
  end

  # CONTACT FORM
  resources :contacts, only: [:create]
  get "contact" => "contacts#new"

  get "map" => "pages#map"
  get "timeline" => "pages#timeline"
  get "thematic" => "pages#category"
  resources :page_infos, only: [:update]
  resources :categories, only: [:create, :update, :destroy]
  resources :articles, only: [:show]
  resources :users, only: [:update]
  resources :comments, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

