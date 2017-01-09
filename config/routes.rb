Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  namespace :admin do
    get "/" => "dashboard#home"
    get "thematics" => "dashboard#categories"
    resources :category4as, only: [:create, :destroy]
    resources :region4as, only: [:create, :destroy]
    resources :articles, only: [:index, :show, :new, :create, :edit, :update]
  end

  get "map" => "pages#map"
  get "thematic" => "pages#category"
  resources :page_infos, only: [:update]
  resources :categories, only: [:create, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

