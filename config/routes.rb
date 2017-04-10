Rails.application.routes.draw do
  namespace :api do  
  mount_devise_token_auth_for 'Employee', at: 'auth'
  end
  # post 'employee_token' => 'employee_token#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :employees
  resources :employees, only:[ :create]
  resources :projects
  resources :time_entries
end
