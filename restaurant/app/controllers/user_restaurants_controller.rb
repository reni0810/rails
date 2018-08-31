class UserRestaurantsController < ApplicationController
  def index
    search = {}
    search[:user_id] = current_user.id
    search[:name] = params[:search] if params[:search].present?
    search[:"restaurants_cuisines.cuisine_id"] = params[:cuisine_id] if params[:cuisine_id].present?
    search[:"restaurants_facilities.facility_id"] = params[:facility_id] if params[:facility_id].present?
    search[:"unavailabities.date"] = params[:date] if params[:date].present?
    @restaurants = Restaurant.left_outer_joins(:restaurants_cuisines,:restaurants_facilities,:unavailabities).where(search).order(:name).page(params[:page]).per(2)
  end
end
