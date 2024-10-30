# app/controllers/api/priv/v1/play_actions_controller.rb
module Api
  module Priv
    module V1
      class PlayActionsController < ApplicationController
        before_action :ensure_admin
        before_action :set_play_action, only: %i[show update destroy]

        # GET /api/priv/v1/play_actions
        def index
          @play_actions = PlayAction.all
          render json: @play_actions
        end

        # GET /api/priv/v1/play_actions/1
        def show
          render json: @play_action
        end

        # POST /api/priv/v1/play_actions
        def create
          @play_action = PlayAction.new(play_action_params)

          if @play_action.save
            render json: @play_action, status: :created, location: api_priv_v1_play_action_url(@play_action)
          else
            render json: @play_action.errors, status: :unprocessable_entity
          end
        end

        # PATCH/PUT /api/priv/v1/play_actions/1
        def update
          if @play_action.update(play_action_params)
            render json: @play_action, status: :ok
          else
            render json: @play_action.errors, status: :unprocessable_entity
          end
        end

        # DELETE /api/priv/v1/play_actions/1
        def destroy
          @play_action.destroy!
          head :no_content
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
    end
  end
end
