class Admin::ItemsController < ApplicationController


  def new
    @item = Item.new
    # @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to　admin_item_path(params[:id])
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :explanation, :is_active, :price, :genre_id)
  end

end
