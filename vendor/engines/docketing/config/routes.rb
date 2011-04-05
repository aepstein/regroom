Refinery::Application.routes.draw do
  # Dockets namespace for PUBLIC pages
  scope(:path => 'docketing', :as => 'docketing', :module => 'docketing') do
    root :to => 'dockets#index', :as => 'docketing_root'
    resources :perspectives, :only => [:index, :show]
    resources :dockets, :only => [:index, :show]
  end

  # Admin namespace
  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    # Dockets namespace within admin namespace
    scope(:path => 'docketing', :as => 'docketing', :module => 'docketing') do
      resources :perspectives, :except => :show
      resources :dockets, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end
end

