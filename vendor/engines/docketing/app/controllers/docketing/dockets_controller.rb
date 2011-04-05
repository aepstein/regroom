module Docketing
  class DocketsController < DocketingController

    before_filter :find_all_dockets

    def index
      # you can use meta fields from your model instead (e.g. browser_title)
      # by swapping @page for @docket in the line below:
      present(@page)
    end

    def show
      @docketing_docket = DocketingDocket.find(params[:id])

      # you can use meta fields from your model instead (e.g. browser_title)
      # by swapping @page for @docket in the line below:
      present(@page)
    end

  protected

    def find_all_dockets
      @docketing_dockets = DocketingDocket.order('position ASC')
    end

  end
end

