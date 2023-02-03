Rails.application.routes.draw do
  devise_for :users

  root 'welcome#index'
  match 'dashboard' => 'dashboard#dashboardutente', :via => :get


end