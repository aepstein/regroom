module Admin
  module Docketing
    class PerspectivesController < Admin::BaseController

      crudify :docket_perspective, :sortable => false,
              :title_attribute => 'name', :xhr_paging => true

    end
  end
end

