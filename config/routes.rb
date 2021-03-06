Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'

  get '/home', to:'pages#index'

  resources :recipes do
    member do
      post 'like'
    end
  end

  resources :chefs, except: :new
  get '/register', to:'chefs#new'

  get '/login', to: 'logins#new'
  post '/login', to: 'logins#create'
  get '/logout', to: 'logins#destroy'


end
