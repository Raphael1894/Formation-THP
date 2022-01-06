# frozen_string_literal: true

class LogosController < ApplicationController
  def update
    @instructor = Instructor.find(params[:instructor_id])
    @instructor.logo.attach(params[:logo])
    redirect_to(edit_instructor_path(@instructor))
  end
end
