class OrdersController < ApplicationController

  def index
    @orders = Order.order("created_at")

    @array = []
    @orders.each do |var|
      temp = var.orderlist
      temp = line_split temp
      @array << temp
    end
  end

  def new
    @order = Order.new
    @list = params[:orders_btn]
    @info = line_split params[:orders_btn] 
  end

  def create 
    @list = params[:orders_btn] 
    @order = Order.new(order_params)
    @order.name = current_user.username      
    @order.save
    render :show
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:name, :phone, :orderlist)
  end

  def line_split var
    split_1 = var.split(/,/)      #['product=2', 'product=3'...]
    array = []
    split_1.each do |i|
      hh = {}
      split_2 = i.split(/\=/)  #['product', '2']
      key = split_2[0]
      value = split_2[1]
      hh[key] = value
      array.push hh
    end
  return array
  end
end
