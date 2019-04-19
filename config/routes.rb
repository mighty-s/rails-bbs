Rails.application.routes.draw do

  root 'posts#index'
  
  resources :users
  resources :posts
  resources :comments
  resources :sessions, only: [:new, :create, :destroy]
  
  # # users 경로
  # post 'users/create'
  
  # get 'users/new'

  # #posts 경로 (게시판)
  # get 'posts/index'

  # get 'posts/show'

  # get 'posts/create'

  # get 'posts/update'

  # get 'posts/destroy'
  
  # get 'posts/new'

  # # ssessions 경로
  # get 'sessions/new'

  # get 'sessions/create'
  
  # get 'sessions/destroy'
  
  # post 'sessions/create/:user',to: 'sessions#create',as: 'session_create'
  
  # delete 'sessions/destroy',to: 'sessions#destroy',as: 'session_destroy'
  
  # #Comments 경로
  # get 'comments/new'

  # get 'comments/create'

  # get 'comments/destroy'

  # get 'posts/edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  # About Restful API
  #   * Difference between PUT and PATCH
  #     PUT은 해당 자원이 통채로 교체되는 것을 의미하며 PATCH는 해당 자원의 일부분만 변경되는 것을 의미
  #
  #

end
