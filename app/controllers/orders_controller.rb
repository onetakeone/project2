class OrdersController < ApplicationController

  before_action :authenticate_user!

  def index
    # Order page is available for admin only
    if current_user.username != 'admin' 
      redirect_to places_url
    end

    # Order list arranged in order of creation
    @orders = Order.order("created_at")

    # Takes Order list STRING from database, converts in into HASH { Key => {Key => value }, ... }.
    # Places HASH into array, so it can be iterated with index.
    @array = []
    @orders.each do |var|
      temp = line_split var.orderlist
      @array << temp
    end
  end

  def new
    @order = Order.new

    # Data from <input type="hidden" name="orders_btn" id="orders_input" > at application.html.erb
    $list = params[:orders_btn]

    # Variable is used at _form.html.erb to show Order list
    $info = line_split params[:orders_btn] 
  end

  def create 
    $list = params[:orders_btn] 
    @order = Order.new(order_params)
    @order.name = current_user.username 
      
    respond_to do |format|  
        if @order.save
          format.html { render :show , notice: 'Place was successfully created.' }
          format.json { render :show, status: :created, location: :show }
        else
          format.html { redirect_back(fallback_location: root_path) }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
    end
        
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:name, :phone, :orderlist)
  end

  def line_split order    
    # Function returns HASH with KEY equal to "Place title" and VALUE equal to "Order list" HASH (names of products and quantity) 
    # Example. String splits at three places: ',' '_' '=':
    # "Stumptown Coffee Roasters_cappuccino=3,Blabla_espresso=1,Stumptown Coffee Roasters_latte=2,Blabla_latte=1"
    # into hash:
    # {"Stumptown Coffee Roasters"=>{"cappuccino"=>"3", "latte"=>"2"}, "Blabla"=>{"espresso"=>"1", "latte"=>"1"}}
    # 
    #
    # Splitting string into separate orders. 
    item_split = order.split(/,/) 
    hash = {}

    # each order do
    item_split.each do |i|

      # KEY = Place title      
      brand_split = i.split(/_/)              
      key = brand_split[0]

      # VALUE = Hash (product => quantity)
      value = {}              
      product_split = brand_split[1].split(/\=/)     
      product_key = product_split[0]
      product_value = product_split[1]
      value[product_key] = product_value

      # if HASH already has a key (Place title) - add another VALUE to Order list   
      if hash.has_key?(key)       
        hash[key][product_key] = product_value
      else
        # if first order - add another VALUE   
        hash[key] = value 
      end        
    end        

    return hash
  end
end
