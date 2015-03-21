Rails.application.routes.draw do

  devise_for :fans, :controllers => { :registrations => "registrations" }
  get 'home/index'

  root to: "home#index"


  resources :missions
  resources :fans do
    collection do
      get 'login', action: :login #fans/login
      post 'login', action: :do_login
      delete 'login', action: :logout
      get 'search' # fans/search
    end
  end

  # get 'fans', to: 'fans#index'
    # get 'fans/:id', to: 'fans#show'
    # get 'fans/new', to: 'fans#new'
    # post 'fans/create', to: 'fans#create'
    # get 'fans/:id/edit', to: 'fans#edit'
    # put 'fans/:id/update', to: 'fans#update'
    # delete 'fans/:id/destroy', to: 'fans#destroy'
    
    get 'artists/index'

    get 'artists/:id', to: 'artists#show'

    # get 'fans/index'

    # fans/123
    # get 'fans/:id', to: 'fans#show' 


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'missions/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: mission.id)
  #   get 'missions/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :missions

  # Example resource route with options:
  #   resources :missions do
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
  #   resources :missions do
  #     resources :comments, :sales
  #     resource :artister
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :missions do
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
  #     # Directs /admin/missions/* to Admin::MissionsController
  #     # (app/controllers/admin/missions_controller.rb)
  #     resources :missions
  #   end
end
