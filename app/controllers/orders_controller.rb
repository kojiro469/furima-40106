class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @order_shipping = OrderShipping.new
  end

  def create
    @order_shipping = OrderShipping.new
    if @order_shipping.valid?
      @order_shipping.save
      redirect_to root_path
    else
      render :index, status: unprocessable_entity
    end
  end

  private
  
  def order_params
    params.require(:order_shipping).permit(
      :post_code,
      :prefecture_id,
      :city,
      :address,
      :building_name,
      :phone_number,
    ).merge(item_id: @item.id, user_id: current_id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
