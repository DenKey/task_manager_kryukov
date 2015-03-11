Rails.application.routes.draw do
  resources :lists do
    resources :todos do
    	member do
    		patch :done
    	end
    end
  end
  
  root "lists#index"

end
