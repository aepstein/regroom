module Docketing
  class ItemsController < DocketingController

    before_filter :find_all_docketing_items

    def index
      # you can use meta fields from your model instead (e.g. browser_title)
      # by swapping @page for @docket_item in the line below:
      present(@page)
    end

    def show
      @docketing_item = DocketingItem.find(params[:id])

      # you can use meta fields from your model instead (e.g. browser_title)
      # by swapping @page for @docket_item in the line below:
      present(@page)
    end

  protected

    def find_all_docketing_items
      @docketing_items = DocketingItem.scoped
    end

  end
end

