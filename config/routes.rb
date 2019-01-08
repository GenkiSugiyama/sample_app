Rails.application.routes.draw do
  get 'posts/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/top' => 'root#top'

  # new.thml.erbのform_for内の「f.subumit」が実行された時の
  # controllerのcreateアクションを呼び出す
  post '/posts' => 'posts#create'

  # 投稿一覧ページへのルーティング
  get '/posts' => 'posts#index'

  # 投稿詳細ページへのルーティング
  get '/posts/:id' => 'posts#show' , as: 'post'

  # 編集ページへのルーティング
  get '/posts/:id/edit' => 'posts#edit', as: 'edit_post'

  # 編集内容を送信しDBへ保存するルーティング
  patch '/posts/:id' => 'posts#update', as: 'update_post'

  delete '/posts/:id' => 'posts#destroy', as: 'destroy_post'
end
