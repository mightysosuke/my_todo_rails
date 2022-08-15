# == Route Map
#

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # TODO: 後で消す
  get '/public', to: 'public#public'
  get '/private', to: 'private#private'
end
