Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get  'users/sign_up', to: 'users/registrations#new'
    get '/users/sign_out', to: 'devise/sessions#destroy'
    get  'users/addresses', to: 'users/registrations#new_address'
    post 'users/addresses', to: 'users/registrations#create_address'
  end
  resources :mypages, only: [:index, :show, :edit]
  resources :books do
    resources :comments,  only: [:create, :destroy]
    collection do
      get 'sell'
      get 'get_category_children', defaults: { fomat: 'json'}
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'front#index'
end
