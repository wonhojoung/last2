Rails.application.routes.draw do

  devise_for :users
#create
get '/posts/new' => 'posts#new'
post '/posts/create' => 'posts#create'

#read
root 'posts#index'
get '/posts/show/:post_id' => 'posts#show'

#destroy
post '/posts/destroy/:post_id' => 'posts#destroy'


#update
get '/posts/edit/:post_id' => 'posts#edit'
post '/posts/update/:post_id' => 'posts#update'




#comment 라우츠
#create
 post '/posts/show/:post_id/comments/create' => 'comments#create'

#destroy
 post '/posts/show/:post_id/comments/destroy/:comment_id' => 'comments#destroy'
end
