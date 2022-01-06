# frozen_string_literal: true

class AvatarsController < ApplicationController
  def update
    @user = User.find(params[:user_id])
    @user.avatar.attach(params[:avatar])
    redirect_to(edit_user_path(@user))
  end
end
