class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @user = current_user
  end

  def edit

  end

  def show
    
  end

  def update
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:nickname, :gender_id, :age_group_id, :profile_image)
  end
end
