# app/controllers/api/priv/v1/players_controller.rb
module Api
  module Priv
    module V1
      class PlayersController < ApplicationController
        before_action :ensure_login
        before_action :set_player, only: %i[show update destroy]

        # GET /api/priv/v1/players
        def index
          @players = current_user.players
          render json: @players
        end

        # GET /api/priv/v1/players/1
        def show
          render json: @player
        end

        # POST /api/priv/v1/players
        def create
          @player = current_user.players.new(player_params)

          if @player.save
            render json: @player, status: :created, location: api_priv_v1_player_url(@player)
          else
            render json: @player.errors, status: :unprocessable_entity
          end
        end

        # PATCH/PUT /api/priv/v1/players/1
        def update
          if @player.update(player_params)
            render json: @player, status: :ok
          else
            render json: @player.errors, status: :unprocessable_entity
          end
        end

        # DELETE /api/priv/v1/players/1
        def destroy
          @player.active = false
          @player.save!
          head :no_content
        end

        private

          # Use callbacks to share common setup or constraints between actions.
          def set_player
            @player = Player.find(params[:id])
          end

          # Only allow a list of trusted parameters through.
          def player_params
            params.require(:player).permit(:user_id, :first_name, :last_name, :active)
          end
      end
    end
  end
end
