#Setting the Application Home Page

#added
# CRUD
Rails.application.routes.draw do
  root "articles#index"

  # state 1
  #get "/articles", to: "articles#index"
  #get "/articles/:id", to: "articles#show" # CRUD
  # 2 lines replaced with:
  
  # state 2  
  #resources :articles

  #Rails provides a routes method named resources
  #that maps all of the conventional routes for a collection of resources
  
  # state 3
  # with 2 resources, 2 Classes
  resources :articles do
    resources :comments
  end
end
# end added

=begin
Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
=end

=begin
# added
Rails.application.routes.draw do
  get "/articles", to: "articles#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
# end added
=end