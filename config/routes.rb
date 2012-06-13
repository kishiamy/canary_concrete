CanaryConcrete::Application.routes.draw do
  scope ":locale", locale: /#{I18n.available_locales.join('|')}/ do

    resources :groups 
    resources :pages

    devise_for :users
    match "admin/groups" => "admin#manage_groups", :as => :user_list
    match "admin/groups/:id/edit" => "admin#update", :via => :put, :as => :edit_user_group

    root :to => 'pages#index'
    match '*path', to: redirect("/#{I18n.default_locale}/%{path}"), :constraints => lambda {|req|
	I18n.default_locale != req.path.split('/')[1].to_sym
    }
    
    match '*path', to: 'error#error_404'
  end
  match '*path', to: redirect("/#{I18n.default_locale}/%{path}")
  match '', to: redirect("/#{I18n.default_locale}/pages")
   
end
