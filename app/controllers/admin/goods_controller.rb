class Admin::GoodsController < ApplicationController
  layout 'admin'
  def index
    @goods = Good.all

  end

  def destroy
    good = Good.find params[:id]
    good.destroy
    redirect_to :back
  end
end
