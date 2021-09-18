class Admin::ItemsController < ApplicationController


  def new
    @item = Item.new
    # @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to
    else
      render :new
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:name, :image_id, :explanation, :is_active, :price)
  end

end
