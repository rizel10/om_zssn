Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
  	namespace :v1 do
  		resources :survivors do
  			resources :reports, only: :create
  			resources :trades do
  				member do
        		put "accept"
        	end
  			end
  		end
  	end
  end

end
