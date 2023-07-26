Rails.application.routes.draw do
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # 顧客
  scope module: :public do
      root to: 'homes#top'
      get '/about' => 'homes#about'
      #検索
      get "search" => "searches#search"

      resources :customers
  end

  # 管理者
  namespace :admin do
    #検索
    get "search" => "searches#search"

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
