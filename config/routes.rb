BaliwagIs::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: "pages#index"

  # Creates a URL /vessels and attaches to controller vessels_controller.rb method index
  # as: :vessels --> Creates a variable for the URL called vessels_path
  get "/vessels", to: "vessels#index", as: :vessels
  resources :crews do
    get "/report", to: "crews#print_report", as: :print_report
  end
  get "/crews/search", to: "crews#search", as: :crews_search

  get "/reports/:crew_id/misuga", to: "reports#misuga", as: :reports_misuga
  get "/reports/:crew_id/baliwag_nav_biodata", to: "reports#baliwag_nav_biodata", as: :baliwag_nav_biodata
  resources :vessels
  resources :vessel_types

  namespace :api do
    get "/crew_count_by_vessel", to: "dashboard#crew_count_by_vessel", as: :crew_count_by_vessel
    get "/crew_count_by_rank", to: "dashboard#crew_count_by_rank", as: :crew_count_by_rank
  end

  resources :documents

  get "/reports/crews", to: "crews#reports", as: :crews_reports
  get "/reports/:id/generate_crew_file", to: "crews#generate_crew_file", as: :generate_crew_file
  resources :principals, only: [:index, :show]
  resources :transmittal_records
end
