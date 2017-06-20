Rails.application.routes.draw do


  resources :blogs
  resources :blogs do
    resources :comments
    get 'page/:page', action: :index, on: :collection
  end


  get 'puzzles/new'
  post 'puzzles/show'

  devise_for :users
  resources :articles
  resources :products

  resources :products do
    resources :reviews
    get 'page/:page', action: :index, on: :collection
  end

  resources :articles do
    get 'page/:page', action: :index, on: :collection
  end

  #custom route for the articles emailing
  get '/articles/email_article/:id',
      to: 'articles#email_article',
      as: 'email_article'


  #dave's way is the same ...
  #for the store controller
  get 'store/index'
  get 'store/:id', controller: 'store', action:'show', as: "store/show"
  resources :store do
    get 'page/:page', action: :index, on: :collection
  end


  #my old way.
  #get 'store(/:id)',
  #    to:'store#show',
  #    as:'store_show'
  #created useless post and puts in routes just to make SEO...
  #resources :store do
  #  get 'page/:page', action: :index, on: :collection
  #end


  get 'page/home'

  get 'page/about_us'

  get 'page/contact_us'
  post 'page/contact_us'

  get 'page/products'

  get 'page/newsletter'

  get 'page/blog'

  get 'page/calendar((/:month)/:year)',
      to: 'page#calendar',
      as: 'page_calendar'

  get 'page/articles'

  get 'page/login'

  root 'page#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
