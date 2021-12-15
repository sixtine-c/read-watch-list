Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  resources :categories, only: %i[index show] do
    resources :lists do
      resources :bookmarks
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
