Rails.application.routes.draw do
  resources :posts, only: [:new, :create, :show, :index, :edit, :update, :destroy] do
    collection do
      post 'confirm'
      get 'confirm'

    end
  end
end