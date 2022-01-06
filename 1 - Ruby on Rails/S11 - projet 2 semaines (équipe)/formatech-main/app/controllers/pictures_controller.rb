# frozen_string_literal: true

class PicturesController < ApplicationController
  def update
    @course = Course.find(params[:course_id])
    @course.picture.attach(params[:picture])
    redirect_to(course_path(@course))
  end
end
