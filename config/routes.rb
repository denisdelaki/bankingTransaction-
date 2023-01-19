Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'transactions', to: 'transactions#index'
  post 'transactions', to: 'transactions#create'
  get 'accounts/:name', to: 'accounts#show'
end
