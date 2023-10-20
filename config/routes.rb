Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :lists, only: [:show, :new, :create] do
    resources :bookmarks, only: [:new, :create ]
  end
  resources :bookmarks, only: [:destroy]
  delete '/lists/:id', to: 'lists#destroy', as: :delete_list

  # Defines the root path route ("/")
  # root "articles#index"
  root "lists#index"
end
