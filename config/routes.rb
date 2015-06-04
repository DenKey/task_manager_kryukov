Rails.application.routes.draw do

  root "static_pages#index"
  get  "privacy_policy", controller: "static_pages", as: :privacy

  resources :lists do
    resources :todos do
    	member do
    		patch :done
    		patch :undone
    	end
    end
  end
  
  devise_for :user, path: "",
    :controllers => {
      :registrations => "registrations"
    },
    path_names: {
        :sign_in => "login",
        :sign_out => "logout",
        :registrations => "register",
        :edit => "profile"
    }
end