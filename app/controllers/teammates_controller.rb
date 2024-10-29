class TeammatesController < ApplicationController
  before_action :ensure_login
  before_action :set_teammate, only: %i[ show edit update destroy ]

  # GET /teammates or /teammates.json
  def index
    @teammates = Teammate.all
  end

  # GET /teammates/1 or /teammates/1.json
  def show
  end

  # GET /teammates/new
  def new
    @teammate = Teammate.new
  end

  # GET /teammates/1/edit
  def edit
  end

  # POST /teammates or /teammates.json
  def create
    @teammate = Teammate.new(teammate_params)

    respond_to do |format|
      if @teammate.save
        format.html { redirect_to @teammate, notice: "Teammate was successfully created." }
        format.json { render :show, status: :created, location: @teammate }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @teammate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teammates/1 or /teammates/1.json
  def update
    respond_to do |format|
      if @teammate.update(teammate_params)
        format.html { redirect_to @teammate, notice: "Teammate was successfully updated." }
        format.json { render :show, status: :ok, location: @teammate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @teammate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teammates/1 or /teammates/1.json
  def destroy
    @teammate.destroy!

    respond_to do |format|
      format.html { redirect_to teammates_path, status: :see_other, notice: "Teammate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teammate
      @teammate = Teammate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def teammate_params
      params.fetch(:teammate, {})
    end
end
