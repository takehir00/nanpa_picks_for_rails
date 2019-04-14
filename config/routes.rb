Rails.application.routes.draw do
  #admin機能
  get 'admin/top' => 'admin#top'
  get 'admin/articles/index' => 'admin#articles_index'
  get 'admin/articles/new' => 'admin#articles_new'
  get 'admin/articles/edit/:id' => 'admin#articles_edit'

  #articles機能
  root to: 'articles#top'
  resources :articles
end
