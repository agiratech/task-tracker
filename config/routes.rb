Rails.application.routes.draw do
  namespace :api do  
<<<<<<< HEAD
  mount_devise_token_auth_for 'Employee', at: 'auth'
=======
  mount_devise_token_auth_for 'Employee', at: 'auth', skip: [:registrations]
>>>>>>> bc066787c10c1351e5b9204b9a637a7e8ffb30ac
  end
  # post 'employee_token' => 'employee_token#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :employees
  resources :employees, only:[ :create]
  resources :projects
  resources :time_entries
end
