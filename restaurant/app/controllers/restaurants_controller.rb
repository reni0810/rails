class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  # GET /restaurants
  # GET /restaurants.json
  def index
    if params[:search].present? || params[:cuisine_id].present? ||  params[:facility_id].present?
      @restaurants = Restaurant.joins(:cuisines,:facilities, :recipes)
      .where('restaurants.name LIKE ? OR restaurants.address LIKE ?
      AND restaurants_cuisines.cuisine_id LIKE ?
      AND restaurants_facilities.id LIKE ?
      AND restaurants_cuisines_recipes.recipe_id LIKE ? ',
      "%#{params[:search]}%", "%#{params[:search]}%", 
      "%#{params[:cuisine_id]}%", 
      "%#{params[:facility_id]}%" )
    else
      @restaurants = Restaurant.all
    end
    @restaurants = @restaurants.order(:name).page(params[:page]).per(1)
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user_id = current_user.id
    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :address, :mobile_no,:picture,
        timings_attributes:
        [:id, :day, :start_time, :end_time, :_destroy],
        unavailabities_attributes:
        [:id, :date, :start_time, :end_time, :full_day, :_destroy],
        restaurants_cuisines_attributes:
        [:id,:restaurant_id, :cuisine_id,:_destroy, restaurants_cuisines_recipes_attributes: [:id, :restaurants_cuisine_id, :recipe_id,:_destroy]],
        restaurants_facilities_attributes:
        [:id, :restaurant_id, :facility_id,:_destroy])

    end
end
