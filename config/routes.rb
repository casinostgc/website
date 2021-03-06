Rails.application.routes.draw do

	resources :cruise_lists

	concern :imageable do
		resources :pictures, only: [:index, :show]
	end

	concern :admin_imageable do
		resources :pictures, except: [:show]
	end

	devise_for :users

	resources :testimonials, except: [:edit, :update, :destroy]

	resources :pages, :attractions, only: [:show]

	resources :flights, only: [:index, :show]

	resources :casinos, concerns: [:imageable], only: [:index, :show]

	resources :destinations, concerns: [:imageable], only: [:index, :show]

	resources :venues, path: :ships, concerns: [:imageable], only: [:index, :show] do
		resources :attractions, concerns: [:imageable], only: [:index]
	end

	resources :ports, :events, :cruises, :cruise_lists, concerns: [:imageable], only: [:index, :show]

	namespace :maps do
		resources :casinos, only: [:index, :show]
		resources :cruises, :destinations, :cruise_lists, only: [:show]
	end

	namespace :admin do
		get '/' => 'admin#index', as: :admin

		resources :admin, only: [:index]

		resources :pages, :pictures, :testimonials, :cruise_lists, except: [:show]

		resources :destinations, :casinos, :events, :cruises, :ports, :attractions, concerns: [:admin_imageable], except: [:show]

		resources :venues, path: :ships, concerns: [:admin_imageable], except: [:show]

		resources :flights, except: [:show] do
			collection { post :import }
		end

		resources :menu_items, except: [:show] do
			collection { post :sort }
		end

		get '/menus', to: "menu_items#index"
		get '/:id', to: "pages#show", as: 'short_page'
	end

	get '/email_signature' => 'static_pages#email_signature'
	get '/robots.txt' => 'static_pages#robots'

	get '/:id', to: "pages#show", as: 'short_page'

	# root 'static_pages#index'
	root 'pages#root'

end
