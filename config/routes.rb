Rails.application.routes.draw do

  root to: 'articles#top'
  resources :articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
