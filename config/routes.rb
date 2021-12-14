Rails.application.routes.draw do
  get 'wants/create'
  get 'wants/destroy'
  devise_for :users
  root to: "collections#index"

  resources :users, only: :show do
    collection do
      get 'search'
    end
  end
  
  resources :collections do
    resource :wants, only: [:create, :destroy]

    collection do
      get 'search'
    end

  end

end
