Rails.application.routes.draw do
  resources :translations

  devise_for :users, controllers: {sessions: 'users/sessions', registrations: "users/registrations"}
  resources :favorite_users, only: [:create, :destroy]
  resources :ratings, only: [:create, :destroy]

  devise_scope :user do
    post '/becometranslator' => 'users/registrations#becometranslator', as: :becometranslator
    post '/becomeuser' => 'users/registrations#becomeuser', as: :becomeuser
    post '/becomepm' => 'users/registrations#becomepm', as: :becomepm
    post '/averageupdating' => 'users/registrations#averageupdating', as: :averageupdating
  end

  root 'welcome#index'

  match 'dashboardtraduttore' => 'dashboard#dashboardtraduttore', :via => :get
  match 'dashboardpm'=> 'dashboard#dashboardpm', :via => :get
  match 'dashboardutente'=> 'dashboard#dashboardutente', :via => :get
  match 'classifica'=> 'classifica#classificaindex', :via => :get
  match 'ratings' => 'rating#create', :via => :get
  match 'translation' => 'translations#destroy', :via => :delete
  match 'traduzioni' => 'classifica#traduzioni', :via => :get



end