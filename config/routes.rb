Rails.application.routes.draw do
  get 'static_pages/donations', as: :user_donation

  get 'static_pages/volunteer', as: :user_volunteer

  resources :animal_images
  get 'employees/list' => 'employees#list', as: :employees_list
  devise_for :employees, controllers: {sessions: "sessions", registrations: "employees"}
  resources :employees do
    collection do
      get 'animals' => 'animals#list', as: :animals_list
      get 'animals/new' => 'animals#new', as: :new_animal
      get 'animals/:id' => 'animals#show_employees', as: :show_animal
    end
  end
  get 'dogs' => 'animals#list_dogs', as: :animals_dogs
  get 'cats' => 'animals#list_cats', as: :animals_cats
  post 'animals/filters' => 'animals#filters', as: :animal_filters
  post  'requests/all'  =>            'requests#update_all', as: :update_all_request
  post  'requests/:id'  =>            'requests#update', as: :update_request
  get 'return_animal/:id' => 'animals#return', as: :return_animal_to_shelter
  get 'requests/new/:animal_id' => 'requests#new', as: :new_adoption_request



  get 'endanger/:id' => 'animals#endanger', as: :animal_in_danger
  get 'save/:id' => 'animals#save', as: :animal_save

  delete 'requests' => 'requests#destroy_all'
  get 'global_stats' => 'charts#global_stats', as: :global_stats
  get 'donations_stats' => 'donations#stats', as: :donations_stats


  resources :animals
  resources :requests, only: [:index, :new, :create,:destroy]
  resources :adoptions
  resources :shelter
  resources :donations
  resources :volunteers
  resources :emails, only: [:new, :create]


  #namespace :admin do
  #  resources :animals
  #end


  # STATIC PAGES
  get '/'                        => 'static_pages#index',         as: :user_index
  get '/about'                   => 'static_pages#about',         as: :about
  get '/contacts'                => 'static_pages#contacts',      as: :contacts
  get '/animals'                 => 'animals#user_index',         as: :animals_user_index

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'static_pages#index'

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
