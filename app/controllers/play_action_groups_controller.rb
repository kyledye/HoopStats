class PlayActionGroupsController < ApplicationController
  before_action :ensure_admin
  before_action :set_play_action_group, only: %i[ show edit update destroy ]

  # GET /play_action_groups or /play_action_groups.json
  def index
    @play_action_groups = PlayActionGroup.all
  end

  # GET /play_action_groups/1 or /play_action_groups/1.json
  def show
  end

  # GET /play_action_groups/new
  def new
    @play_action_group = PlayActionGroup.new
  end

  # GET /play_action_groups/1/edit
  def edit
  end

  # POST /play_action_groups or /play_action_groups.json
  def create
    @play_action_group = PlayActionGroup.new(play_action_group_params)

    respond_to do |format|
      if @play_action_group.save
        format.html { redirect_to @play_action_group, notice: "Play action group was successfully created." }
        format.json { render :show, status: :created, location: @play_action_group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @play_action_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /play_action_groups/1 or /play_action_groups/1.json
  def update
    respond_to do |format|
      if @play_action_group.update(play_action_group_params)
        format.html { redirect_to @play_action_group, notice: "Play action group was successfully updated." }
        format.json { render :show, status: :ok, location: @play_action_group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @play_action_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /play_action_groups/1 or /play_action_groups/1.json
  def destroy
    @play_action_group.destroy!

    respond_to do |format|
      format.html { redirect_to play_action_groups_path, status: :see_other, notice: "Play action group was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_play_action_group
      @play_action_group = PlayActionGroup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def play_action_group_params
      params.require(:play_action_group).permit(:name, :is_pinned, :active, :sort_order)
    end
end
