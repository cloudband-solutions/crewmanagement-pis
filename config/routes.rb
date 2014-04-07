BaliwagIs::Application.routes.draw do
  devise_for :users
  # Syntax for to: symbol
  # --> to: "controller#method"
  # --> Looks for a file called controller_controller.rb under app/controllers
  # Index path
  # Browser path: http://localhost:3000/
  root to: "pages#index"

  # Creates a URL /vessels and attaches to controller vessels_controller.rb method index
  # as: :vessels --> Creates a variable for the URL called vessels_path
  get "/vessels", to: "vessels#index", as: :vessels
  resources :crews

  resources :vessels
end
