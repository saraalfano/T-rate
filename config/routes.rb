Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: 'users/sessions', registrations: "users/registrations"}

  root 'welcome#index'

  match 'dashboard' => 'dashboard#dashboardtraduttore', :via => :get
  match 'dashboardpm'=> 'dashboard#dashboardpm', :via => :get
  match 'dashboardutente'=> 'dashboard#dashboardutente', :via => :get


end