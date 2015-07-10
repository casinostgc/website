Rails.application.routes.draw do

	devise_for :users

	resources :pages, only: [:show]
	resources :destinations, only: [:index, :show]
	# resources :casinos, only: [:index, :show]
	resources :flights, only: [:index, :show]
	resources :ports, only: [:index, :show]
	resources :events, only: [:index, :show]
	resources :cruises, controller: 'events', type: 'Cruise', only: [:index, :show]
	resources :venues, only: [:index, :show] do
		resources :events, only: [:index, :show]
		resources :cruises, controller: 'events', type: 'Cruise', only: [:index, :show]
	end
	
	get '/:id', to: "pages#show", as: 'short_page'

	namespace :admin do
		get '/' => 'admin#index', as: :admin
		resources :admin, only: [:index]
		resources :pages, except: [:show]
		resources :menu_items, except: [:show] do
			collection { post :sort }
		end
		resources :events, except: [:show]
		resources :cruises, controller: 'events', type: 'Cruise', except: [:show]
		resources :destinations, except: [:show]
		resources :casinos, except: [:show]
		resources :flights, except: [:show] do
			collection { post :import }
		end
		resources :ports, except: [:show]
		resources :venues, except: [:show] do
			# resources :ships
		end

		# resources :pictures, except: [:show]

		get '/menus', to: "menu_items#index"
	end

	root 'static_pages#index'
	# root 'pages#root'


end
