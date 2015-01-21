Rails.application.routes.draw do




  # resources :tasks

  resources :organizations do
    resources :employs do
      resources :employments
    end
  end

  # get "/organizations", to "organization#index"


  # get "/orglist", to: 'organizations#index', via: "get"
  # get "/orgnew", to: "organizations#new", via: "get"

  # get "/employeslist/organization[:id]", to: 'organization.employes'

  # get "/orgshow", to: "organizations#show", via: "get"

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



  # #CRUD API Organizations
  post '/api/organizations', :to => 'organizations#api_create'
  get '/api/organizations', :to => 'organizations#api_index'
  get '/api/organizations/:id', :to => 'organizations#api_show'
  put '/api/organizations/:id', :to => 'organizations#api_update'
  delete '/api/organizations/:id', :to => 'organizations#api_destroy'
  #CRUD API Employs
  post '/api/organizations/:organization_id/employs', :to => 'employs#api_create'
  get '/api/organizations/:organization_id/employs', :to => 'employs#api_index'
  get '/api/organizations/:organization_id/employs/:id', :to => 'employs#api_show'
  put '/api/organizations/:organization_id/employs/:id', :to => 'employs#api_update'
  delete '/api/organizations/:organization_id/employs/:id', :to => 'employs#api_destroy'
  get '/api/employs', :to => 'employs#api_all_employs'
  # #CRUD API Tasks
  post '/api/organizations/:organization_id/employs/:employ_id/employments', :to => 'employments#api_create'
  get '/api/organizations/:organization_id/employs/:employ_id/employments', :to => 'employments#api_index'
  get '/api/organizations/:organization_id/employs/:employ_id/employments/:id', :to => 'employments#api_show'
  put '/api/organizations/:organization_id/employs/:employ_id/employments/:id', :to => 'employments#api_update'
  delete '/api/organizations/:organization_id/employs/:employ_id/employments/:id', :to => 'employments#api_destroy'
  get '/api/employments', :to => 'employments#api_all_employments'



  #/api/organizations/:organization_id/employs/:employ_id/employments

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
