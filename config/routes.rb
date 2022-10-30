Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "articles#index"
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # The route declares that GET /articles requests are mapped to the index action of ArticlesController
  # get "/articles", to: "articles#index"
  # get "/articles/:id", to: "articles#show"
  resources :articles
  
end
