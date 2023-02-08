Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: 'users/sessions', registrations: "users/registrations"}

  root 'welcome#index'

  match 'dashboard' =>      'dashboard#dashboardtraduttore', :via => :get
  match 'dashboardpm'=>     'dashboard#dashboardpm',         :via => :get
  match 'dashboardutente'=> 'dashboard#dashboardutente',     :via => :get
  match 'account'   =>      'accounts#account',              :via => :get
  get '/redirect',  to:     'calendar#redirect', as: 'redirect'
  get '/callback',  to:     'calendar#callback', as: 'callback'
  get '/calendar', to:     'calendar#calendar', as: 'calendar'
  get '/events/:calendar_id', to: 'calendar#events', as: 'events', calendar_id: /[^\/]+/

end