require 'rails_helper'

RSpec.describe RestaurantsController, type: :controller do
  before(:each) do
    sign_in  FactoryBot.create(:user)
  end
  let(:restaurant) {FactoryBot.create(:restaurant)}
  let(:timing) {FactoryBot.create(:timing, restaurant: restaurant)}
  let(:unavailabity) {FactoryBot.create(:unavailabity, restaurant: restaurant)}
  let(:cuisine) {FactoryBot.create(:cuisine)}
  let(:facility) {FactoryBot.create(:facility)}
  let(:restaurants_cuisine) {FactoryBot.create(:restaurants_cuisine, restaurant: restaurant, cuisine: cuisine)}
  let(:restaurants_facility) {FactoryBot.create(:restaurants_facility, restaurant: restaurant, cuisine: facility)}

  describe "GET #index" do
    before do
      get :index
    end
    it "render index template" do
      expect(response).to  render_template("index")
    end
  end

  describe "GET #show" do
    before do
      get :show, params: {id: restaurant.id}
    end
    it "check show" do
      expect(assigns(:restaurant)).to eq(restaurant)
    end

    it "render show template" do
      expect(response).to  render_template("show")
    end
  end

  describe "GET #new" do
    before do
      get :new
    end
    it "check new" do
      expect(assigns(:restaurant)).to be_a_new(Restaurant)
    end

    it "render new template" do
      expect(response).to  render_template("new")
    end
  end

  describe "GET #edit" do
    before do
      get :edit, params: {id: restaurant.id}
    end
    it "check edit" do
      expect(assigns(:restaurant)).to eq(restaurant)
    end

    it "render edit template" do
      expect(response).to  render_template("edit")
    end
  end

  describe "POST #create" do
    it "check create for valid" do
      restaurant = FactoryBot.attributes_for(:restaurant)
      timing = FactoryBot.attributes_for(:timing )
      unavailabity = FactoryBot.attributes_for(:unavailabity)
      restaurants_cuisine = FactoryBot.attributes_for(:restaurants_cuisine, cuisine_id: cuisine.id)
      restaurants_facility = FactoryBot.attributes_for(:restaurants_facility, facility_id: facility.id)
      expect{post :create, params: {restaurant: restaurant.merge(timings: timing, unavailabities: unavailabity,restaurants_cuisines: restaurants_cuisine ,restaurants_facilities: restaurants_facility  )}}.to change(Restaurant,:count).by(1)
    end

    it "render create template" do
      post :create, params: {restaurant: FactoryBot.attributes_for(:restaurant)}
      expect(response).to  redirect_to Restaurant.last
    end
  end


end
