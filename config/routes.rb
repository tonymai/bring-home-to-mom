Rails.application.routes.draw do

  devise_for :users, class_name: 'Parent', :controllers => { :registrations => "registrations" }

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  resources :users, only: [:index, :show] do
    resources :profiles
  end

  resources :interests, only: [:index, :create]
  resources :dates, class_name: 'Playdate', controller: :playdates
  resources :values, only: [:index, :create]

  # for payments
  resources :charges, only: [:new, :create]

  get '/filters' => 'filters#filter_matches'

  get '/filters/autocomplete/interests' => 'filters#autocomplete_interest_name'
  get '/filters/autocomplete/values' => 'filters#autocomplete_value_name'

  get '/users/:id/messages' => 'users#messages'

  post '/' => 'welcome#change_child'

  resources :conversations do
    resources :messages
  end

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
