module Admin
  module Docketing
    class DocketsController < Admin::BaseController

      crudify :docket, :searchable => true,
              :redirect_to_url => :admin_docketing_dockets_url,
              :title_attribute => 'name', :xhr_paging => true

    end
  end
end

