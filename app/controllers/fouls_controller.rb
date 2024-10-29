class FoulsController < ApplicationController
  before_action :ensure_admin
  before_action :set_foul, only: %i[ show edit update destroy ]

  # GET /fouls or /fouls.json
  def index
    @fouls = Foul.all
  end

  # GET /fouls/1 or /fouls/1.json
  def show
  end

  # GET /fouls/new
  def new
    @foul = Foul.new
  end

  # GET /fouls/1/edit
  def edit
  end

  # POST /fouls or /fouls.json
  def create
    @foul = Foul.new(foul_params)

    respond_to do |format|
      if @foul.save
        format.html { redirect_to @foul, notice: "Foul was successfully created." }
        format.json { render :show, status: :created, location: @foul }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @foul.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fouls/1 or /fouls/1.json
  def update
    respond_to do |format|
      if @foul.update(foul_params)
        format.html { redirect_to @foul, notice: "Foul was successfully updated." }
        format.json { render :show, status: :ok, location: @foul }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @foul.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fouls/1 or /fouls/1.json
  def destroy
    @foul.destroy!

    respond_to do |format|
      format.html { redirect_to fouls_path, status: :see_other, notice: "Foul was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_foul
      @foul = Foul.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def foul_params
      params.require(:foul).permit(:name, :description, :is_technical, :active, :sort_order)
    end
end
