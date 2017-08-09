class PlacesController < ApplicationController
  before_action :authenticate_user!
  #before_action :set_place, only: [:show, :edit, :update, :destroy]

  def index
    @places = Place.order("title")
    @hash = Gmaps4rails.build_markers(@places) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
      marker.infowindow place.title
    end
  end

  def show
    @users = User.all
    @place = Place.find(params[:id])
    @commentable = @place
    @comments = @commentable.comments
    @comment = Comment.new
  end

  def new
    @user = current_user
    @place = @user.places.new
  end

  def edit
    @place = Place.find(params[:id])
    if @place.user_id != current_user.id
      redirect_to places_url
    end
  end

  def create
    @user = current_user
    @place = @user.places.new(place_params)
      respond_to do |format|  
        if @place.save
          format.html { redirect_to @place, notice: 'Place was successfully created.' }
          format.json { render :show, status: :created, location: @place }
        else
          format.html { render :new }
          format.json { render json: @place.errors, status: :unprocessable_entity }
        end
    end
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update
    @user = current_user    
      respond_to do |format|
        if @user.places.update(place_params)
          format.html { redirect_to :place, notice: 'Place was successfully updated.' }
          format.json { render :show, status: :ok, location: @place }
        else
          format.html { render :edit }
          format.json { render json: @place.errors, status: :unprocessable_entity }
        end
      end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_url, notice: 'Place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:description, :title, :tags, :address, :latitude, :longitude, :espresso, :cappuccino, :latte )
    end
end
