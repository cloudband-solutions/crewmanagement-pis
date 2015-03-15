BaliwagIs::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: "pages#index"
  get "/about_this_software", to: "pages#about_this_software"

  # Creates a URL /vessels and attaches to controller vessels_controller.rb method index
  # as: :vessels --> Creates a variable for the URL called vessels_path
  get "/vessels", to: "vessels#index", as: :vessels

  # Crew related routes
  resources :crews do
    get "/report", to: "crews#print_report", as: :print_report
  end
  get "/crews/search/advanced", to: "crews#advanced_search", as: :crews_advanced_search

  # Report related routes
  get "/reports/:crew_id/misuga", to: "reports#misuga", as: :reports_misuga
  get "/reports/:crew_id/baliwag_nav_biodata", to: "reports#baliwag_nav_biodata", as: :baliwag_nav_biodata

  resources :vessels, only: [:index, :show]
  resources :vessel_types

  namespace :account do
    resources :users, only: [:edit, :update, :show]
  end

  namespace :api do
    get "/vessels/crew_list/:vessel_id", to: "vessels#crew_list", as: :vessel_crew_list
    namespace :v1 do
      # Crew related information
      get "/crews/:crew_token", to: "crews#profile", as: :crew_profile
    end
    get "/crew_count_by_vessel", to: "dashboard#crew_count_by_vessel", as: :crew_count_by_vessel
    get "/crew_count_by_rank", to: "dashboard#crew_count_by_rank", as: :crew_count_by_rank
  end

  namespace :internal do
    get "/vessels/:vessel_id/crews", to: "vessels#crews", as: :vessel_crews
    get "/crews/:id", to: "crews#show", as: :crew
  end

  resources :documents

  get "/reports/crews", to: "crews#reports", as: :crews_reports
  get "/reports/:id/generate_crew_file", to: "crews#generate_crew_file", as: :generate_crew_file
  get "/reports/:id/generate_transmittal_record", to: "reports#transmittal_record", as: :generate_transmittal_record

  get "/reports/crew_manifest", to: "reports#crew_manifest", as: :reports_crew_manifest
  post "/reports/crew_manifest", to: "reports#crew_manifest", as: :reports_crew_manifest_generate
  get "/reports/download_crew_manifest", to: "reports#download_crew_manifest", as: :reports_download_crew_manifest

  resources :principals, only: [:index, :show]

  resources :transmittal_records, except: [:new]
  get "/transmittal_records/:vessel_id/new", to: "transmittal_records#new", as: :new_transmittal_record
  post "/transmittal_records/new", to: "transmittal_records#new_tr", as: :new_tr

  post "/transmittal_records/:id/approve", to: "transmittal_records#approve", as: :transmittal_record_approve
  post "/transmittal_records/:id/transit", to: "transmittal_records#transit", as: :transmittal_record_transit
end
