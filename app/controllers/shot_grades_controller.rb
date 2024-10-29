class ShotGradesController < ApplicationController
  before_action :ensure_admin
  before_action :set_shot_grade, only: %i[ show edit update destroy ]

  # GET /shot_grades or /shot_grades.json
  def index
    @shot_grades = ShotGrade.all
  end

  # GET /shot_grades/1 or /shot_grades/1.json
  def show
  end

  # GET /shot_grades/new
  def new
    @shot_grade = ShotGrade.new
  end

  # GET /shot_grades/1/edit
  def edit
  end

  # POST /shot_grades or /shot_grades.json
  def create
    @shot_grade = ShotGrade.new(shot_grade_params)

    respond_to do |format|
      if @shot_grade.save
        format.html { redirect_to @shot_grade, notice: "Shot grade was successfully created." }
        format.json { render :show, status: :created, location: @shot_grade }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shot_grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shot_grades/1 or /shot_grades/1.json
  def update
    respond_to do |format|
      if @shot_grade.update(shot_grade_params)
        format.html { redirect_to @shot_grade, notice: "Shot grade was successfully updated." }
        format.json { render :show, status: :ok, location: @shot_grade }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shot_grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shot_grades/1 or /shot_grades/1.json
  def destroy
    @shot_grade.destroy!

    respond_to do |format|
      format.html { redirect_to shot_grades_path, status: :see_other, notice: "Shot grade was successfully destroyed." }
      format.json { head :no_content }
    end
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
