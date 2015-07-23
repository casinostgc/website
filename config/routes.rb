Rails.application.routes.draw do

	concern :imageable do
		resources :pictures, only: [:index, :show]
	end
	concern :admin_imageable do
		resources :pictures, except: [:show]
	end

	devise_for :users

	resources :pages, only: [:show]

	resources :flights, only: [:index, :show]

	resources :casinos, concerns: [:imageable], only: [:index, :show]
	resources :destinations, concerns: [:imageable], only: [:index, :show] do
		resources :casinos, concerns: [:imageable], only: [:index, :show]
	end

	resources :venues, concerns: [:imageable], only: [:index, :show] do
		resources :attractions, concerns: [:imageable], only: [:index]
	end

	resources :ports, concerns: [:imageable], only: [:index, :show]

	resources :cruises, controller: 'events', type: 'Cruise', concerns: [:imageable], only: [:index, :show]
	resources :land_events, controller: 'events', type: 'LandEvent', path: 'land-events', concerns: [:imageable], only: [:index, :show]

	namespace :admin do
		get '/' => 'admin#index', as: :admin

		resources :admin, only: [:index]

		resources :pages, :events, :pictures, except: [:show]

		resources :destinations, :casinos, :ports, :venues, :attractions, concerns: [:admin_imageable], except: [:show]

		resources :cruises, controller: 'events', type: 'Cruise', concerns: [:admin_imageable], except: [:show]
		resources :land_events, controller: 'events', type: 'LandEvent', path: 'land-events', concerns: [:admin_imageable], except: [:show]

		resources :flights, except: [:show] do
			collection { post :import }
		end

		resources :menu_items, except: [:show] do
			collection { post :sort }
		end

		get '/menus', to: "menu_items#index"
	end

	get '/:id', to: "pages#show", as: 'short_page'

	get '/robots.txt' => 'static_pages#robots'

	root 'static_pages#index'
	# root 'pages#root'

end
