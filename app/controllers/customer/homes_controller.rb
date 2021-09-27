class Customer::HomesController < ApplicationController

  def top
    @genres = Genre.all
    @items = Item.all.order("created_at DESC").page(params[:page]).per(4)  # "DESC"は降順(新着から表示)
  end

  def about
  end

end
