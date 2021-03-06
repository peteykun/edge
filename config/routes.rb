Edge::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  root  'events#index'
  match '/gallery',            to: 'gallery#index',               via: 'get'
  match '/login',              to: 'sessions#new',                via: 'get'
  match '/register',           to: 'participants#new',            via: 'get'
  match '/profile',            to: 'participants#show_current',   via: 'get'
  match '/ucp',                to: 'participants#edit_current',   via: 'get'
  match '/logout',             to: 'sessions#destroy',            via: 'get'
  match '/ambassador_program', to: 'ambassador_applications#new', via: 'get'
  get   '/gallery/show'
  match '/categories/set_preferred/:id', to: 'categories#set_preferred', via: :post
  match '/accommodation', to: 'accommodation_requests#new', via: :get
  match '/map', to: 'static_pages#map', via: :get

  resources :events
  resources :contacts
  resources :messages
  resources :sponsors
  resources :gallery_photos
  resources :participants
  resources :ambassador_applications
  resources :sessions
  resources :accommodation_requests

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
