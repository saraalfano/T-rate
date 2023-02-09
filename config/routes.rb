Rails.application.routes.draw do

  devise_for :users, controllers: {sessions: 'users/sessions', registrations: "users/registrations", omniauth_callbacks: "users/omniauth_callbacks"}
  resources :favorite_users, only: [:create, :destroy]
  resources :ratings, only: [:create, :destroy]
  resources :translations
  
  devise_scope :user do
    post '/becometranslator' => 'users/registrations#becometranslator', as: :becometranslator
    post '/becomeuser' => 'users/registrations#becomeuser', as: :becomeuser
    post '/becomepm' => 'users/registrations#becomepm', as: :becomepm
  end

  root 'welcome#index'

  match 'dashboardtraduttore' => 'dashboard#dashboardtraduttore', :via => :get
  match 'dashboardpm'=> 'dashboard#dashboardpm', :via => :get
  match 'dashboardutente'=> 'dashboard#dashboardutente', :via => :get
  match 'classifica'=> 'classifica#classificaindex', :via => :get
  match 'ratings' => 'rating#create', :via => :get
  match 'translation' => 'translations#destroy', :via => :delete
  match 'traduzioni' => 'classifica#traduzioni', :via => :get
  match 'calendario' => 'calendar#redirect', :via => :get
  get '/redirect',  to:     'calendar#redirect', as: 'redirect'
  get '/callback',  to:     'calendar#callback', as: 'callback'
  get '/calendar', to:     'calendar#calendar', as: 'calendar'
  get '/events/:calendar_id', to: 'calendar#events', as: 'events', calendar_id: /[^\/]+/

end