Rails.application.routes.draw do
  resources :itens_caixas
  resources :payments
  resources :caixas
  get 'control_users/index'

  resources :unid_meds
  resources :insumos
  resources :itens_pedidos
  resources :pedidos
  resources :estoques
  resources :grupo_estoques
  resources :funcionarios
  resources :fornecedors
  resources :fabricantes
  resources :faricantes
  resources :grupo_de_estoques
  resources :funcionarios
  resources :fornecedors
  resources :fabricantes
  devise_for :users
  resources :clients
  resources :home
  get 'home/index'



   namespace :api, defaults: {format: 'json'} do 
     resources :itens_pedidos
   end

   namespace :api, defaults: {format: 'json'} do 
     resources :pedidos
   end

   namespace :api, defaults: {format: 'json'} do 
     resources :estoques
   end

   namespace :api, defaults: {format: 'json'} do 
     resources :caixas
   end

   namespace :api, defaults: {format: 'json'} do 
     resources :insumos
   end

   namespace :api, defaults: {format: 'json'} do 
     resources :itens_caixas
   end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root to: 'home#index'


  get 'listar/:id' => 'itens_pedidos#litar_item_pedido'
  get '/home/cadastra/:id/:id_est' => 'home#cadastra'
  post '/home/salva' => 'home#salva'
  get 'status/:id' => 'pedidos#status'
  get 'status2/:id' => 'pedidos#status2'
  get '/home/json/:id' => 'home#json'
  get '/home/jsonValor/:id' => 'home#jsonValor'
  get '/home/teste/:id' => 'home#teste'
  
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
