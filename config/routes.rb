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
      get 'general_reports/percentage_infected', to: 'general_reports#percentage_infected'
      get 'general_reports/avg_item_amount', to: 'general_reports#avg_item_amount'
      get 'general_reports/points_lost', to: 'general_reports#points_lost'
  	end
  end

end
