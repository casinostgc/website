Rails.application.routes.draw do

	# devise_for :users

	resources :pages, only: [:show]
	resources :destinations, only: [:index, :show]
	resources :casinos, only: [:index, :show]
	resources :flights, only: [:index, :show]
	resources :cruises, only: [:index, :show]
	resources :ports, only: [:index, :show]
	resources :events, only: [:index, :show]
	resources :venues, only: [:index, :show] do
		# resources :ships
	end

	namespace :admin do
		get '/' => 'admin#index', as: :admin
		resources :admin, only: [:index]
		resources :pages, except: [:show]
		resources :menu_items, except: [:show] do
			collection { post :sort }
		end
		resources :events, except: [:show]
		resources :destinations, except: [:show]
		resources :casinos, except: [:show]
		resources :flights, except: [:show] do
			collection { post :import }
		end
		resources :cruises, except: [:show]
		resources :ports, except: [:show]
		resources :venues, except: [:show] do
			# resources :ships
		end

		resources :pictures, except: [:show]

		get '/menus', to: "menu_items#index"
	end

	root 'static_pages#index'

end
