Rails.application.routes.draw do
  get"/cars", to:'cars#index'
  get "/cars/new", to:'cars#new'
  get"/cars/:id", to:'cars#show'
  post "/cars", to:'cars#create'
  delete "/cars/:id", to:'cars#destroy'
  get "cars/:id/edit", to:'cars#edit'
  patch "cars/:id", to:'cars#update'
end
