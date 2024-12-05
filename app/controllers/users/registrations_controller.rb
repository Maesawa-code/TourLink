class Users::RegistrationsController < Devise::RegistrationsController
  def create
    @user = User.new(sign_up_params)

    if @user.save
      redirect_to root_path
    else
     
      render :new, status: :unprocessable_entity
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :gender_id, :age_group_id, :profile_image)
  end
end
