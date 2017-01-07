Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  namespace :admin do
    get "/" => "dashboard#home"
    get "artisanat" => "dashboard#artisanat"
    get "voyages" => "dashboard#voyages"
  end

  resources :page_infos, only: [:update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

