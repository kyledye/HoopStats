# app/controllers/api/priv/v1/fouls_controller.rb
module Api
  module Priv
    module V1
      class FoulsController < ApplicationController
        before_action :ensure_admin
        before_action :set_foul, only: %i[show update destroy]

        # GET /api/priv/v1/fouls
        def index
          @fouls = Foul.all
          render json: @fouls
        end

        # GET /api/priv/v1/fouls/1
        def show
          render json: @foul
        end

        # POST /api/priv/v1/fouls
        def create
          @foul = Foul.new(foul_params)

          if @foul.save
            render json: @foul, status: :created, location: api_priv_v1_foul_url(@foul)
          else
            render json: @foul.errors, status: :unprocessable_entity
          end
        end

        # PATCH/PUT /api/priv/v1/fouls/1
        def update
          if @foul.update(foul_params)
            render json: @foul, status: :ok
          else
            render json: @foul.errors, status: :unprocessable_entity
          end
        end

        # DELETE /api/priv/v1/fouls/1
        def destroy
          @foul.destroy!
          head :no_content
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
    end
  end
end
