class ShotTypesController < ApplicationController
  before_action :ensure_admin
  before_action :set_shot_type, only: %i[ show edit update destroy ]

  # GET /shot_types or /shot_types.json
  def index
    @shot_types = ShotType.all
  end

  # GET /shot_types/1 or /shot_types/1.json
  def show
  end

  # GET /shot_types/new
  def new
    @shot_type = ShotType.new
  end

  # GET /shot_types/1/edit
  def edit
  end

  # POST /shot_types or /shot_types.json
  def create
    @shot_type = ShotType.new(shot_type_params)

    respond_to do |format|
      if @shot_type.save
        format.html { redirect_to @shot_type, notice: "Shot type was successfully created." }
        format.json { render :show, status: :created, location: @shot_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shot_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shot_types/1 or /shot_types/1.json
  def update
    respond_to do |format|
      if @shot_type.update(shot_type_params)
        format.html { redirect_to @shot_type, notice: "Shot type was successfully updated." }
        format.json { render :show, status: :ok, location: @shot_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shot_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shot_types/1 or /shot_types/1.json
  def destroy
    @shot_type.destroy!

    respond_to do |format|
      format.html { redirect_to shot_types_path, status: :see_other, notice: "Shot type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shot_type
      @shot_type = ShotType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shot_type_params
      params.fetch(:shot_type, {})
    end
end
