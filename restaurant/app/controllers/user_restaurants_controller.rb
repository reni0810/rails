class UserRestaurantsController < ApplicationController
  def index
      @restaurants = Restaurant.where(user_id: current_user.id)
  end
end
