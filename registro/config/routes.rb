Rails.application.routes.draw do

  root :to => 'home#show'
  
  #Alunno
  get "loginalunno" => "sessionealunno#new"
  get "registrazionealunno" => "alunni#new"
  post "sessionealunno/create"
  get "logoutalunno" => "sessionealunno#destroy"
  get "menualunno" => "alunni#menu"
  get "elenco" => 'alunni#elenco'
  get "assenzealunno" => "assenze/:alunno_id", to: "assenze#index"
  get "notedisciplinarialunno" => "notedisciplinari/:alunno_id", to: "notedisciplinari#index"
  get "votialunno" => "voti/:alunno_id", to: "voti#index"

  #Docenza
  get "logindocenza" => "sessionedocenza#new"
  get "registrazionedocenza" => "docenze#new"
  post "sessionedocenza/create"
  get "logoutdocenza" => "sessionedocenza#destroy"
  get "menudocenza" => "docenze#menu"

  #Amministrazione
  get "loginamministrazione" => "sessioneamministrazione#new"
  get "registrazioneamministrazione" => "amministrazioni#new"
  post "sessioneamministrazione/create"
  get "logoutamministrazione" => "sessioneamministrazione#destroy"
  get "menuamministrazione" => "amministrazioni#menu"


  get "doc_sez_mat" => "docenza_sezione_materie/:sezione_id", to: 'docenza_sezione_materie#index'
  get "nuovoinsegnamento" => "docenza_sezione_materie#nuovoinsegnamento"
  post "/alunno_attivitaextras/new"
	

  resources :alunno_attivitaextras

  resources :voti

  resources :sezioni

  resources :notedisciplinari

  resources :materie

  resources :compiti

  resources :circolari

  resources :attivitaextras

  resources :assenze

  resources :docenze

  resources :amministrazioni

  resources :alunni

  resources :docenza_sezione_materie

  #Email confirmation
  resources :alunni do
    member do
      get :confirm_email
    end
  end

  resources :docenze do
    member do
      get :confirm_email
    end
  end

  resources :amministrazioni do
    member do
      get :confirm_email
    end
  end

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
