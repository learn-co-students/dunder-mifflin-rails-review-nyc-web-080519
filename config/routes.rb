Rails.application.routes.draw do
  get '/dogs/sort', to: "dogs#sort", as: "sort_dogs"
  resources :dogs
  resources :employees

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
