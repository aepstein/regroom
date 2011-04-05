module Admin
  module Docketing
    class PerspectivesController < Admin::BaseController

      crudify :docketing_perspective, :sortable => false, :searchable => true,
              :title_attribute => 'name', :xhr_paging => true

    end
  end
end

