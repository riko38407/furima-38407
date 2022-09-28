class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :non_purchased_item, only: [:index, :create]
  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    if  @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
   params.require(:order_form).permit(:prefecture_id, :city, :house_number, :building_name, :phone_number,:post_code).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def  non_purchased_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id 
  end

end
