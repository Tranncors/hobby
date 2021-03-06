Rails.application.routes.draw do
  get 'charges/new'

  get 'charges/create'

  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'google_flights#index'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
   
  get 'notes' => 'notes#index'
  resources :notes
  resources :google_flights, only:[:index]
  resources :search_flights, only:[:index]
  resources :cities, only:[:index]
  resources :airlines, only:[:index]
  resources :airports, only:[:index]
  resources :request, only:[:index]
  resources :charges, only: [:new, :create]
  
  get 'thanks', to: 'charges#thanks', as: 'thanks'
  #get 'airport/:iata' => 'cities#index'
  
  get 'cities/:code', :to => 'cities#show', as: :code
  
  namespace :api do
    namespace :v1 do
  resources :items, only:[:index]
   end
 end
  
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
