class PlayActionsController < ApplicationController
  before_action :ensure_admin
  before_action :set_play_action, only: %i[ show edit update destroy ]

  # GET /play_actions or /play_actions.json
  def index
    @play_actions = PlayAction.all
  end

  # GET /play_actions/1 or /play_actions/1.json
  def show
  end

  # GET /play_actions/new
  def new
    @play_action = PlayAction.new
  end

  # GET /play_actions/1/edit
  def edit
  end

  # POST /play_actions or /play_actions.json
  def create
    @play_action = PlayAction.new(play_action_params)

    respond_to do |format|
      if @play_action.save
        format.html { redirect_to @play_action, notice: "Play action was successfully created." }
        format.json { render :show, status: :created, location: @play_action }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @play_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /play_actions/1 or /play_actions/1.json
  def update
    respond_to do |format|
      if @play_action.update(play_action_params)
        format.html { redirect_to @play_action, notice: "Play action was successfully updated." }
        format.json { render :show, status: :ok, location: @play_action }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @play_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /play_actions/1 or /play_actions/1.json
  def destroy
    @play_action.destroy!

    respond_to do |format|
      format.html { redirect_to play_actions_path, status: :see_other, notice: "Play action was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_play_action
      @play_action = PlayAction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def play_action_params
      params.require(:play_action).permit(:play_action_group_id, :name, :points, :requires_coordinates, :requires_fouls, :requires_substitutions, :style, :active, :sort_order)
    end
end
