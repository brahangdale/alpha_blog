Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#home"
  get 'about', to: "pages#about"


  resources :articles
  
  get 'signup', to: 'users#new'
  get 'edit', to: 'users#edit'
  
  resources :users, except:[:new]
    get 'user', to: 'users#show'


  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

resources :categories, except: [:destroy]
end
