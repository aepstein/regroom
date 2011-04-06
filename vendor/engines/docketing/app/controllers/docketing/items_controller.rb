module Docketing
  class ItemsController < DocketingController

    before_filter :find_all_docketing_items
    before_filter :new_docketing_item_from_params, :only => [ :new, :create ]
    before_filter :find_docketing_item, :only => [ :show, :edit, :update ]

    def index
      # you can use meta fields from your model instead (e.g. browser_title)
      # by swapping @page for @docket_item in the line below:
      present(@page)
    end

    def show

      # you can use meta fields from your model instead (e.g. browser_title)
      # by swapping @page for @docket_item in the line below:
      present(@page)
    end

    # POST /docketing/dockets/:docketing_docket_id/items
    # POST /docketing/dockets/:docketing_docket_id/items.xml
    def create
    end

    # GET /docketing/dockets/:docketing_docket_id/items/new
    def new
    end

    # GET /docketing/items/:id/edit
    def edit
    end

    # PUT /docketing/items/:id
    # PUT /docketing/items/:id.xml
    def update
    end

  protected

    def new_docketing_item_from_params
      @docketing_item = @docketing_docket.items.build( params[:docketing_item] )
    end

    def find_docketing_item
      @docketing_item = DocketingItem.find( params[:id] )
    end

    def find_all_docketing_items
      @docketing_items = DocketingItem.scoped
    end

  end
end

