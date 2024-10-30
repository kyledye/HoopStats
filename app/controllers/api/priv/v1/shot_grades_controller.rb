# app/controllers/api/priv/v1/shot_grades_controller.rb
module Api
  module Priv
    module V1
      class ShotGradesController < ApplicationController
        before_action :ensure_admin
        before_action :set_shot_grade, only: %i[show update destroy]

        # GET /api/priv/v1/shot_grades
        def index
          @shot_grades = ShotGrade.all
          render json: @shot_grades
        end

        # GET /api/priv/v1/shot_grades/1
        def show
          render json: @shot_grade
        end

        # POST /api/priv/v1/shot_grades
        def create
          @shot_grade = ShotGrade.new(shot_grade_params)

          if @shot_grade.save
            render json: @shot_grade, status: :created, location: api_priv_v1_shot_grade_url(@shot_grade)
          else
            render json: @shot_grade.errors, status: :unprocessable_entity
          end
        end

        # PATCH/PUT /api/priv/v1/shot_grades/1
        def update
          if @shot_grade.update(shot_grade_params)
            render json: @shot_grade, status: :ok
          else
            render json: @shot_grade.errors, status: :unprocessable_entity
          end
        end

        # DELETE /api/priv/v1/shot_grades/1
        def destroy
          @shot_grade.destroy!
          head :no_content
        end

        private

          # Use callbacks to share common setup or constraints between actions.
          def set_shot_grade
            @shot_grade = ShotGrade.find(params[:id])
          end

          # Only allow a list of trusted parameters through.
          def shot_grade_params
            params.require(:shot_grade).permit(:name, :description, :made_multiplier, :missed_multiplier, :score, :active, :sort_order)
          end
      end
    end
  end
end
