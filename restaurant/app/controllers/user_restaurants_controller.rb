class UserRestaurantsController < ApplicationController
  def index
      @restaurants = Restaurant.where(user_id: current_user.id).order(:name).page(params[:page]).per(1)
  end
  
end
