class Admin::GoodsController < ApplicationController
  layout 'admin'
  def index
    @goods = Good.all

  end

  def edit
    @good = Good.find params[:id]
  end

  def update
    @good = Good.find params[:id]
    @good.update_attributes(good_params)
    redirect_to admin_goods_path
  end

  def destroy
    good = Good.find params[:id]
    good.destroy
    redirect_to admin_goods_path
  end

  private
  def good_params
    params.require(:good).permit(:value)
  end
end
