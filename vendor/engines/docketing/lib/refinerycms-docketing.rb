require 'refinerycms-base'
require 'ancestry'
require 'state_machine'

module Refinery
  module Docketing
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "refinerycms_docketing"
          plugin.url = { :controller => 'admin/docketing/dockets', :action => 'index' }
          plugin.menu_match = /^\/?(admin|refinery)\/docketing\/?(dockets|items|perspectives)?/
          plugin.activity = {
            :class => DocketingDocket,
            :title => 'name'
          }
        end
      end
    end
  end
end

