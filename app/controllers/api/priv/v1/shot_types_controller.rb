# app/controllers/api/priv/v1/shot_types_controller.rb
module Api
  module Priv
    module V1
      class ShotTypesController < ApplicationController
        before_action :ensure_admin
        before_action :set_shot_type, only: %i[show update destroy]

        # GET /api/priv/v1/shot_types
        def index
          @shot_types = ShotType.all
          render json: @shot_types
        end

        # GET /api/priv/v1/shot_types/1
        def show
          render json: @shot_type
        end

        # POST /api/priv/v1/shot_types
        def create
          @shot_type = ShotType.new(shot_type_params)

          if @shot_type.save
            render json: @shot_type, status: :created, location: api_priv_v1_shot_type_url(@shot_type)
          else
            render json: @shot_type.errors, status: :unprocessable_entity
          end
        end

        # PATCH/PUT /api/priv/v1/shot_types/1
        def update
          if @shot_type.update(shot_type_params)
            render json: @shot_type, status: :ok
          else
            render json: @shot_type.errors, status: :unprocessable_entity
          end
        end

        # DELETE /api/priv/v1/shot_types/1
        def destroy
          @shot_type.destroy!
          head :no_content
        end

        private

          # Use callbacks to share common setup or constraints between actions.
          def set_shot_type
            @shot_type = ShotType.find(params[:id])
          end

          # Only allow a list of trusted parameters through.
          def shot_type_params
            params.require(:shot_type).permit(:name, :active, :sort_order)
          end
      end
    end
  end
end
