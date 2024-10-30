# app/controllers/api/priv/v1/teammates_controller.rb
module Api
  module Priv
    module V1
      class TeammatesController < ApplicationController
        before_action :ensure_login
        before_action :set_teammate, only: %i[show update destroy]

        # GET /api/priv/v1/teammates
        def index
          @teammates = Teammate.all
          render json: @teammates
        end

        # GET /api/priv/v1/teammates/1
        def show
          render json: @teammate
        end

        # POST /api/priv/v1/teammates
        def create
          @teammate = Teammate.new(teammate_params)

          if @teammate.save
            render json: @teammate, status: :created, location: api_priv_v1_teammate_url(@teammate)
          else
            render json: @teammate.errors, status: :unprocessable_entity
          end
        end

        # PATCH/PUT /api/priv/v1/teammates/1
        def update
          if @teammate.update(teammate_params)
            render json: @teammate, status: :ok
          else
            render json: @teammate.errors, status: :unprocessable_entity
          end
        end

        # DELETE /api/priv/v1/teammates/1
        def destroy
          @teammate.destroy!
          head :no_content
        end

        private

          # Use callbacks to share common setup or constraints between actions.
          def set_teammate
            @teammate = Teammate.find(params[:id])
          end

          # Only allow a list of trusted parameters through.
          def teammate_params
            params.require(:teammate).permit(:season_team_id, :player_id, :jersey_number, :active)
          end
      end
    end
  end
end
