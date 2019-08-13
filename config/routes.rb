Rails.application.routes.draw do
  get 'welcome/show'
  constraints Clearance::Constraints::SignedIn.new do
    # I believe there is a bug in this RC release of Rails 6
    # Where I cannot use the "root" method more than once in routes.rb
    # So I just manually direct with "get" here
    get "/", to: "dashboards#show"
  end

  root to: "homes#show"

  resources :shouts, only: [:create, :show] do
    member do
      post '/like' => "likes#create"
      delete '/unlike' => "likes#destroy"
    end
  end

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, only: [:create]

  resources :users, only: [:create, :show] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
    
    member do
      post '/follow' => "followed_users#create"
      delete '/unfollow' => "followed_users#destroy"
    end
  end

  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
