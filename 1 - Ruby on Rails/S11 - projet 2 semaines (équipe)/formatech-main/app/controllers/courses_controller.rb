# frozen_string_literal: true

class CoursesController < ApplicationController
  before_action :set_course, only: %i[show edit update destroy vote]
  respond_to :js, :html, :json
  before_action :restrict_access, only: %i[show edit update destroy vote]

  # GET /courses or /courses.json
  def index
    @courses = Course.all
    @courses_featured = CoursesFeatured.all
  end

  # GET /courses/1 or /courses/1.json
  def show
    @user = current_user
    @course = Course.find(params[:id])
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit; end

  # POST /courses or /courses.json
  def create
    helpers.create_tags
    @course = Course.new(course_params)
    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
    helpers.course_creation_email
  end

  # PATCH/PUT /courses/1 or /courses/1.json
  def update
    helpers.update_tags
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1 or /courses/1.json
  def destroy
    one_instructor = Instructor.find( helpers.find_course_by_params.instructor_id)
    @course.destroy
    respond_to do |format|
      if instructor_signed_in?
        format.html { redirect_to instructor_path(current_instructor), notice: 'Course was successfully destroyed.' }
      else
        format.html { redirect_to user_path(current_user), notice: 'Course was successfully destroyed.' }
      end
      format.json { head :no_content }
    end
    helpers.course_destroy_email(one_instructor)
  end

  def vote
    if !current_user.liked? @course
      @course.liked_by current_user
    elsif current_user.liked? @course
      @course.unliked_by current_user
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def course_params
    params.require(:course).permit(:title, 
                                   :price,
                                   :diploma,
                                   :description,
                                   :remote,
                                   :address,
                                   :zip_code,
                                   :duration,
                                   :start_date,
                                   :duration_scale,
                                   :picture,
                                   :instructor_id)
  end

  def restrict_access
    if instructor_signed_in?
      redirect_to root_path if current_instructor.nil?
    elsif user_signed_in?
      redirect_to root_path if current_user.nil?
    end
  end
end
