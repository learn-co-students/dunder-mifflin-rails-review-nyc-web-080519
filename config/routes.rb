Rails.application.routes.draw do
  # resources :dogs
  # resources :employees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

#Employee Routes
  get '/employees', to: 'employees#index', as: 'employees'
  get '/employees/new', to: 'employees#new', as: 'new_employee'
  get '/employees/:id', to: 'employees#show', as: 'employee'
  get '/employees/:id/edit', to: 'employees#edit', as: 'edit_employee'
  patch '/employees/:id', to: 'employees#update'
  post '/employees', to: 'employees#create'

#Dog Routes
  get '/dogs', to: 'dogs#index', as: 'dogs'
  get '/dogs/sort', to: 'dogs#sort', as: 'sort_dogs'
  get '/dogs/:id', to: 'dogs#show', as: 'dog'

end
