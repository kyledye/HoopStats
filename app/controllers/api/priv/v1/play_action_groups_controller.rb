# app/controllers/api/priv/v1/play_action_groups_controller.rb
module Api
  module Priv
    module V1
      class PlayActionGroupsController < ApplicationController
        before_action :ensure_admin
        before_action :set_play_action_group, only: %i[show update destroy]

        # GET /api/priv/v1/play_action_groups
        def index
          @play_action_groups = PlayActionGroup.all
          render json: @play_action_groups
        end

        # GET /api/priv/v1/play_action_groups/1
        def show
          render json: @play_action_group
        end

        # POST /api/priv/v1/play_action_groups
        def create
          @play_action_group = PlayActionGroup.new(play_action_group_params)

          if @play_action_group.save
            render json: @play_action_group, status: :created, location: api_priv_v1_play_action_group_url(@play_action_group)
          else
            render json: @play_action_group.errors, status: :unprocessable_entity
          end
        end

        # PATCH/PUT /api/priv/v1/play_action_groups/1
        def update
          if @play_action_group.update(play_action_group_params)
            render json: @play_action_group, status: :ok
          else
            render json: @play_action_group.errors, status: :unprocessable_entity
          end
        end

        # DELETE /api/priv/v1/play_action_groups/1
        def destroy
          @play_action_group.destroy!
          head :no_content
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
    end
  end
end
