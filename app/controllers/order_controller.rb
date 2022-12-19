class OrderController < ApplicationController

    def list
        @items= Item.all 
        #Rails to search the Item table and store each row it finds in the @items instance object.
    end

    def show 
        @item=Item.find(params[:id])    
        #Rails to find only item details that has id defined in params [:id]
    end

    def new 
        @items=Item.new
        @itemtype = ItemType.all
        #Rails to create a new item type and append it to @itemtype object

    end


    def create
        @items=Item.new(item_param)

            if @items.save                  #if @items object values are saved to database, method redirects to 'list'
                redirect_to :action =>'list'

            else 
                @itemtype = ItemType.all    #if @items object values are not saved, method recalls the 'new'  method to user
                render :action => 'new'
    end

    def edit
        @item=Item.find(params[:id])   # particular item is selected, and changes are updated to @item_type object
        @item_type=ItemType.all

    end

    def delete
        Item.find(params[:id]).destroy # destroy takes away the item from the database 
        redirect_to :action => 'list'
    end

    def update
        @item = Item.find(params[:id])
	
            if @item.update_attributes(book_param)   #update attribute takes values from form and gets updated in the database
                redirect_to :action => 'show', :item_id => @item
            else
                @item_type = ItemType.all
                render :action => 'edit'
            end
    end

    def item_param     #item_param are defined here with their column names from database
        params.require(:item).permit(:item_name,:item_price,:item_type,:id)
    end

end
