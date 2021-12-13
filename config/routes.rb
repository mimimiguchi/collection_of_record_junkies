Rails.application.routes.draw do
  devise_for :users
  root to: "collections#index"

  resources :users, only: :show do
    collection do
      get 'search'
    end
  end
  
  resources :collections do
    collection do
      get 'search'
    end
  end

end
