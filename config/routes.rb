Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get  'users/sign_up', to: 'users/registrations#new'
    get  'users/sign_out', to: 'devise/sessions#destroy'
    get  'users/addresses', to: 'users/registrations#new_address'
    get  'users/edit_addresses', to: 'users/registrations#edit_address'
    post 'users/addresses', to: 'users/registrations#create_address'
  end

  resources :mypages, only: [:index, :show, :edit]do
   member do
     get 'address', to: 'mypages#my_address'
   end
  end

  resources :books, only: [:index, :show, :new, :create, :edit, :destroy]do
    resources :comments,  only: [:create, :destroy]
    collection do
      get 'confirmation', to: 'books#confirmation'
      get 'get_category_children', defaults: { fomat: 'json'}
    end
  end

  resources :creditcard, only: [:create, :show, :edit, :new, :destroy] do
    collection do
      post 'delete', to: 'card#delete'
      get 'registration', to:'card#registration'
    end
     member do
      get 'show', to: 'card#show'
    end
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'front#index'
end
