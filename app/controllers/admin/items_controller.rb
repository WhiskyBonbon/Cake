class Admin::ItemsController < ApplicationController


  def new
    @item = Item.new
    # @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item)
    else
      render :edit
    end
  end
  
  def index
    @items = Item.all
    @items = Item.page(params[:page]).per(10)
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :explanation, :is_active, :price, :genre_id)
  end

end
