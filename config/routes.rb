Rails.application.routes.draw do

  root "static_pages#index"

  resources :lists do
    resources :todos do
    	member do
    		patch :done
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
