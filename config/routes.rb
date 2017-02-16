Rails.application.routes.draw do
 get"/cars", to:'cars#index'
 get"cars/:id", to:'cars#show'
end
