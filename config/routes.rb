Rails.application.routes.draw do
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
 devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}


root to: "public/homes#top"


#マイページ
delete '/public/users/destroy' => 'public/users#destroy'
get '/public/users/my_page' => 'public/users#show'
get '/public/users/infomation/edit' => 'public/users#edit'
patch '/public/users/infomation' => 'public/users#update'
get '/public/users/unsubscribe' => 'public/users#unsubscribe'

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
get '/admin/saunas/:id' => 'admin/saunas#show', as: :admin_saunas_show
get '/admin/saunas/:id/edit' => 'admin/saunas#edit', as: :admin_saunas_edit
delete '/admin/saunas/:id' => 'admin/saunas#destroy', as: :admin_saunas_destroy
get '/admin/saunas/search' => 'admin/saunas#search'
get '/admin/saunas/result' => 'admin/saunas#result'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
