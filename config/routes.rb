Rails.application.routes.draw do
  #商品登録一覧ルート
  get 'items' => 'items#index'
  get 'items/new' => 'items#new'
  get 'items/confirm' => 'items#confirm'
  post 'items/confirm' => 'items#confirm'
  post 'items/back' => 'items#back'
  post 'items/create' => 'items#create'
  get 'items/complete' => 'items#complete'
  get 'items/show' => 'items#show'
  get 'items/:id'  => 'items#destroy'
  delete  'items/:id'  => 'items#destroy'
  patch 'carts/update' => 'carts#update'
  #ホーム画面ルート
  root 'stock_practice#home'
  get 'stock_practice/home'
  get 'contacts/new' => 'contacts#new'
  get 'about' => 'stock_practice#about'
  get 'help' => 'stock_practice#help'

  #ログイン関係ルート
  get 'sessions/new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get 'signup'  => 'users#new'

  #マイページ関係ルート
  get 'carts/index' => 'carts#index'
  get 'carts/confirm' => 'carts#confirm'
  post 'carts/confirm' => 'carts#confirm'
  #問い合わせ関係ルート




  resources :mypages
  resources :users
  resources :items, only: [:new, :create, :back, :edit, :update] do
    collection do
      post :confirm
    end
  end
  resources :items, only: [:index] do
    post 'add'=> 'favorites#create'
    delete '/add' => 'favorites#destroy'
    post 'in' => 'carts#create'
    delete '/in' => 'carts#destroy'
  end
  resources :logs, only: [:edit, :update, :create, :destroy]
  resources :contacts, only: [:new, :create]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
