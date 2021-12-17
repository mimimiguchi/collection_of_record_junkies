Rails.application.routes.draw do
  get 'wants/create'
  get 'wants/destroy'
  devise_for :users
  root to: "collections#index"

  resources :users, only: :show do
    member do
      get 'search'
      get 'wants'
    end
  end
  
  resources :collections do
    resource :wants, only: [:create, :destroy]
    resources :purchases, only: [:index, :create]

    collection do
      get 'search'
    end

  end

end
