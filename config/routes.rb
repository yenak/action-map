Rails.application.routes.draw do

  get '/users' => 'users#index'
  post '/user/:id/edit' => 'users#edit', as: 'edit_user'
  get '/user/:id' => 'users#show', as: 'user'

  root :to => 'map#index'
  get '/state/:state' => 'map#state', as: 'state_map'

  get "/login", to: redirect("/auth/google_oauth2")

  get "/auth/google_oauth2/callback", to: "sessions#create"

  get "/logout", to: "sessions#destroy"
  get "/admin/person/new" => "persons#new", as: 'new_person'
  post "/admin/person" => "persons#create", as: 'create_person'
  get "/admin/person/:id" => "persons#edit", as: 'edit_person'
  get "/person/:id" => "persons#show", as: 'person'
  get "/persons" => "persons#index", as: 'persons'

  get '/events', to: 'events#index'
  post '/events', to: 'events#create'
  get '/events/new', to: 'events#new', as: 'new_event'
  get '/events/delete/:id', to: 'events#destroy', as: 'delete_event'


  # get 'users/:id/interests' => 'users#interests', as: 'interests'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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
