Refinery::Application.routes.draw do
  # Dockets namespace for PUBLIC pages
  scope(:path => 'dockets', :as => 'docket', :module => 'dockets') do
    resources :perspectives, :only => [:index, :show]
  end
  resources :dockets, :only => [:index, :show]

  # Admin namespace
  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    # Dockets namespace within admin namespace
    scope(:path => 'dockets', :as => 'docket', :module => 'dockets') do
      resources :perspectives, :except => :show
    end
    resources :dockets, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end

