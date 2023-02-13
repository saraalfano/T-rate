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
  match 'postemail' => 'suggestions#create', :via=> :post
  match 'dashboardtraduttore' => 'dashboard#dashboardtraduttore', :via => :get
  match 'dashboardpm'=> 'dashboard#dashboardpm', :via => :get
  match 'dashboardutente'=> 'dashboard#dashboardutente', :via => :get
  match 'spellcheck'=> 'dashboard#spellcheck', :via => :get
  match 'classifica'=> 'classifica#classificaindex', :via => :get
  match 'ratings' => 'rating#create', :via => :get
  match 'suggestion'=> 'suggestions#show', :via => :get
  match 'calendar' => 'translations#index', :via => :get
  match 'traduzioni' => 'classifica#traduzioni', :via => :get
  match 'gettranslation' => 'translations#gettranslation', :via => :post
  get '/redirect', to: 'translations#redirect', as: 'redirect'
  get '/callback', to: 'translations#callback', as: 'callback'
  get '/translations', to: 'translations#index', as: 'translationnew'
  # delete '/events/:calendar_id', to: 'calendar#delete_event', as: 'delete_event', calendar_id: /[^\/]+/
 
end