class RegistrationsController < Devise::RegistrationsController

  # Called when user sends data to edit its details.
  def update
    new_params = params.require(:user).permit(:email,
                                              :username,
                                              :current_password,
                                              :password,
                                              :password_confirmation)

    # Edit data without needing to change the password.
    change_password = true
    if params[:user][:password].blank?
      logger.info "Password is blank, updating without password."
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
      new_params = params.require(:user).permit(:email,
                                                :username)
      change_password = false
    end

    # Retrieves current_user from db and updates it with the new_params hash.
    @user = User.find(current_user.id)
    is_valid = @user.valid_password?(params[:user][:current_password])

    # Changes password if fields were included and user is valid.
    if change_password && is_valid
      is_valid = @user.update_with_password(new_params)
    elsif is_valid
      logger.info "About to update without password."
      @user.update_without_password(new_params)
    end

    if is_valid
      set_flash_message :notice, :updated
      sign_in @user, :bypass => true
      redirect_to after_update_path_for(@user)
    else
      flash.now.alert = "Could not update user. Please check your details."
      render "edit"
    end
  end

  # Called when user cancels its account.
  def destroy
    @user = User.find(current_user.id)
    @user.is_active = 0  # not active
    if @user.save
      sign_out @user
      redirect_to root_path
    else
      render "edit"
    end
  end
end
