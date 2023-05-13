Rails.application.routes.draw do
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  
}
devise_scope :user do
  post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
end
 devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}


root to: "public/homes#top"
get 'about', to: 'public/homes#about'

###public###

#サウナ情報
get '/public/saunas' => 'public/saunas#index' 
get '/public/saunas/:id/map' => 'public/saunas#map', as: :public_saunas_map
get '/public/saunas/search' => 'public/saunas#search', as: :public_saunas_search
get '/public/saunas/result' => 'public/saunas#result', as: :public_saunas_result
get '/public/saunas/:id' => 'public/saunas#show', as: :public_saunas_show

#レビュー
get '/public/saunas/:sauna_id/reviews' => 'public/reviews#index', as: :public_sauna_reviews
get '/public/saunas/:sauna_id/reviews/new' => 'public/reviews#new', as: :new_public_sauna_review
post '/public/saunas/:sauna_id/reviews' => 'public/reviews#create', as: :public_sauna_reviews_create
get '/public/saunas/:sauna_id/reviews/:id/edit' => 'public/reviews#edit', as: :edit_public_sauna_review
patch '/public/saunas/:sauna_id/reviews/:id' => 'public/reviews#update', as: :public_sauna_review_update
delete '/public/saunas/:sauna_id/reviews/:id' => 'public/reviews#destroy', as: :public_sauna_review_destroy

#コメント
post '/public/:review_id/comments' => 'public/comments#create', as: :public_comments_create
get '/public/:review_id/comments/:id' => 'public/comments#show', as: :public_comments_show
get '/public/:review_id/comments/:id/edit' => 'public/comments#edit', as: :public_comments_edit
patch '/public/:review_id/comments/:id' => 'public/comments#update', as: :public_comments_update
delete '/public/:review_id/comments/:id' => 'public/comments#destroy',as: :public_comments_destroy




#マイページ
delete '/public/users/destroy' => 'public/users#destroy'
get '/public/users/my_page' => 'public/users#show'
get '/public/users/infomation/edit' => 'public/users#edit'
patch '/public/users/infomation' => 'public/users#update'
get '/public/users/unsubscribe' => 'public/users#unsubscribe'




###admin###

#会員一覧
get 'admin/users' => 'admin/users#index'
get 'admin/users/:id' => 'admin/users#show', as: :admin_users_show
get 'admin/users/:id/edit' => 'admin/users#edit', as: :admin_users_edit
patch '/admin/users/:id' => 'admin/users#update', as: :admin_users_update
delete '/admin/users/:id' => 'admin/users#destroy', as: :admin_users_destroy

#サウナ情報
patch '/admin/saunas/:id' => 'admin/saunas#update', as: :admin_saunas_update
get '/admin/saunas' => 'admin/saunas#index'
get '/admin/saunas/new' => 'admin/saunas#new', as: :admin_saunas_new
post '/admin/saunas' => 'admin/saunas#create', as: :admin_saunas_create
get '/admin/saunas/search' => 'admin/saunas#search'
get '/admin/saunas/result' => 'admin/saunas#result'
get '/admin/saunas/:id' => 'admin/saunas#show', as: :admin_saunas_show
get '/admin/saunas/:id/edit' => 'admin/saunas#edit', as: :admin_saunas_edit
delete '/admin/saunas/:id' => 'admin/saunas#destroy', as: :admin_saunas_destroy


#レビュー
get '/admin/:sauna_id/reviews/' => 'admin/reviews#index', as: :admin_reviews_index
delete '/admin/:sauna_id/reviews/:id' => 'admin/reviews#destroy', as: :admin_reviews_destroy

#コメント機能
get '/admin/:review_id/comments/' => 'admin/comments#index', as: :admin_comments_index
get '/admin/:review_id/comments/:id' => 'admin/comments#show', as: :admin_comments_show
delete '/admin/:review_id/comments/:id' => 'admin/comments#destroy', as: :admin_comments_destroy


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
