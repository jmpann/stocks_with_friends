Rails.application.routes.draw do

#resource routes
  devise_for :users
  resources :stocks

#custom routes
 root 'welcome#index'
 get 'my_portfolio', to: 'users#my_portfolio'
 get 'search_stocks', to: 'stocks#search'




end
