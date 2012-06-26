CanaryConcrete::Application.routes.draw do

  root :to => redirect("/#{I18n.default_locale}/")


  scope ":locale", locale: /#{I18n.available_locales.join('|')}/ do
    root :to => 'pages#show', :id => Page.first.id

    devise_for :users

    resources :groups 
    resources :pages do
      resources :pages
    end
    match "pages/:id/move" => "pages#move", :as => :move_page
    match "pages/:id/update_location" => "pages#update_location", :via => :put, :as => :update_location_page

    match "admin/groups" => "admin#manage_groups", :as => :user_list
    match "admin/groups/:id/edit" => "admin#update", :via => :put, :as => :edit_user_group

    match '*dummy', to: "error#error_404"
  end
  # Capture invalid pages
  match '*dummy', to: "error#error_404", locale: I18n.default_locale.to_s
end
