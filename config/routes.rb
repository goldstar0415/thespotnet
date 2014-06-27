TheSpotNet::Application.routes.draw do	
  namespace :admin do
    get '', to: 'dashboard#index', as: '/'

    resources :users
    resources :properties
    #resources :cleaners
    get 'cleaners_list'                   => 'cleaners#cleaners_list'    
    post 'update_cleaners'                => 'cleaners#update_cleaners'
    get 'time_clocks'                     => 'cleaners#time_clocks'
    get 'management'                     => 'cleaners#management'
    
  end
  
  mount API => '/'

  devise_for :users, controllers: {sessions: "sessions"}
  root :to => 'home#index'

  post 'api/v1/accounts/create'         => 'home#create'
  post 'api/v1/accounts/destroy'        => 'home#destroy'
  
  post 'api/v1/accounts/social_sign_in' => 'home#social_sign_in'

  post 'api/v1/accounts/sign_in'        => 'home#create_session'
  post 'api/v1/accounts/sign_out'       => 'home#delete_session'
  post 'api/v1/accounts/create_account' => 'home#create_account'
  
end
