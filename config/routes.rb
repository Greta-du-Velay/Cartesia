Dtt::Application.routes.draw do

  scope "(:locale)", :locale => /en|fr|el|es|it|pl/ do

    devise_for :users
    resources :users

    match '/choose_locale', :controller => 'home', :action => 'choose_locale'

    # debug (company random)
    match '/companies/create_random', :controller => 'companies', :action => 'create_random'
    match '/report/:permalink', :controller => 'home', :action => 'guest_report'

    resources :companies do
      member do
        get 'report'
        get 'fullreport'
        get 'get_report_data'
        get 'reset_permalink'
        post 'update_levels'
        get 'clear_levels'
      end

      resources :employees do
        member do
          get 'levels'
          post 'levels'

          get 'skills'
          post 'skills'

          get 'report'
          get 'get_report_data'
        end
      end

      resources :bcns do
        resources :learning_indicators
        member do
          get 'report'
          get 'get_report_data'
        end
      end      
    end

    resources :bcn_templates
    resources :priority_ratings

    match ':controller(/:action(/:id(.:format)))'
    root :to => "home#index"
  end
end
