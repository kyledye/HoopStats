# app/controllers/api/priv/v1/periods_controller.rb
module Api
  module Priv
    module V1
      class PeriodsController < ApplicationController
        before_action :ensure_admin
        before_action :set_period, only: %i[show update destroy]

        # GET /api/priv/v1/periods
        def index
          @periods = Period.all
          render json: @periods
        end

        # GET /api/priv/v1/periods/1
        def show
          render json: @period
        end

        # POST /api/priv/v1/periods
        def create
          @period = Period.new(period_params)

          if @period.save
            render json: @period, status: :created, location: api_priv_v1_period_url(@period)
          else
            render json: @period.errors, status: :unprocessable_entity
          end
        end

        # PATCH/PUT /api/priv/v1/periods/1
        def update
          if @period.update(period_params)
            render json: @period, status: :ok
          else
            render json: @period.errors, status: :unprocessable_entity
          end
        end

        # DELETE /api/priv/v1/periods/1
        def destroy
          @period.destroy!
          head :no_content
        end

        private

          # Use callbacks to share common setup or constraints between actions.
          def set_period
            @period = Period.find(params[:id])
          end

          # Only allow a list of trusted parameters through.
          def period_params
            params.require(:period).permit(:name, :is_overtime, :active, :sort_order)
          end
      end
    end
  end
end
