Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "user#index"

  get '/signup' => 'user#new'
  post '/signup' => 'user#create'

  get '/signin' => 'user#signin_new'
  post '/signin' => 'user#signin_create'
  delete '/signout' => 'user#signout'

  get '/users' => 'user#show'
  get '/users/:id/edit' => 'user#show_user'
  patch '/users/:id/edit' => 'user#update_user'
  get '/users/:id/trips' => 'user#show_user_trips'
  delete '/users/:id' => 'user#delete_user'

  get '/trip/new' => 'trip#new'
  post '/trip/new' => 'trip#create'
  get '/trips/:id/edit' => 'trip#edit'
  patch '/trips/:id/edit' => 'trip#update'
 
  
end
