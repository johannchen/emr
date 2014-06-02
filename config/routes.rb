Emr::Application.routes.draw do
  devise_for :users

  root :to => "home#index"

  namespace :admin do
    root :to => "base#index"
    resources :users
  end

#  namespace :api, defaults: {format: :json} do
#    namespace :v1 do
#      devise_scope :user do
#        resource :session, only: [:create, :destroy]
#      end
#    end
#  end

  resources :med_names, defaults: {format: :json}
  resources :diagnosis_names, defaults: {format: :json}
  resources :surgery_names, defaults: {format: :json}

  resources :patients, defaults: {format: :json} do
    resources :allergies
    resources :surgeries
    #resources :reactions
		resources :diagnoses
    resources :medications
    resources :behaviors
    resources :family_members
    resources :visits
  end

  #get 'profile/:id' => 'profiles#show'
  resources :profiles, only: [:show, :edit, :update]

  get '/patient' => 'templates#patient'
  get '/templates/:path.html' => 'templates#template', :constraints => { :path => /.+/ }

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
