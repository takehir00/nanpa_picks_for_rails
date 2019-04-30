Rails.application.routes.draw do

  #admin機能
  get 'admin/top', to: 'admin#top'
  get 'admin/articles/index', to: 'admin#articles_index'
  get 'admin/articles/new', to: 'admin#articles_new'
  get 'admin/articles/edit/:id', to: 'admin#articles_edit'

  #articles機能
  root to: 'articles#top'
  resources :articles

  #users機能
  resources :users
  get 'login_form', to: 'users#login_form'
  post 'login', to: 'users#login'
  delete 'logout', to: 'users#logout'

  #comments機能
  post 'articles/comments/:article_id/:user_id', to: 'comments#create'
  get 'comments/update'
  get 'comments/destroy'
end
