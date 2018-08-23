class UnavailabitiesController < ApplicationController
  before_action :set_unavailabity, only: [:show, :edit, :update, :destroy]

  # GET /unavailabities
  # GET /unavailabities.json
  def index
    @unavailabities = Unavailabity.order(:restaurant_id).page(params[:page]).per(3)
  end

  # GET /unavailabities/1
  # GET /unavailabities/1.json
  def show
  end

  # GET /unavailabities/new
  def new
    @unavailabity = Unavailabity.new
  end

  # GET /unavailabities/1/edit
  def edit
  end

  # POST /unavailabities
  # POST /unavailabities.json
  def create
    @unavailabity = Unavailabity.new(unavailabity_params)

    respond_to do |format|
      if @unavailabity.save
        format.html { redirect_to @unavailabity, notice: 'Unavailabity was successfully created.' }
        format.json { render :show, status: :created, location: @unavailabity }
      else
        format.html { render :new }
        format.json { render json: @unavailabity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unavailabities/1
  # PATCH/PUT /unavailabities/1.json
  def update
    respond_to do |format|
      if @unavailabity.update(unavailabity_params)
        format.html { redirect_to @unavailabity, notice: 'Unavailabity was successfully updated.' }
        format.json { render :show, status: :ok, location: @unavailabity }
      else
        format.html { render :edit }
        format.json { render json: @unavailabity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unavailabities/1
  # DELETE /unavailabities/1.json
  def destroy
    @unavailabity.destroy
    respond_to do |format|
      format.html { redirect_to unavailabities_url, notice: 'Unavailabity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unavailabity
      @unavailabity = Unavailabity.find_by_id(params[:id])
      redirect_to unavailabities_path , notice: "day not found" if @unavailabity.blank?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unavailabity_params
      params.require(:unavailabity).permit(:date, :start_time, :end_time, :full_day, :restaurant_id)
    end
end
