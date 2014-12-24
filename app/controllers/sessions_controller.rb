class SessionsController < Devise::SessionsController

  # Used to show the log in form.
  def new
    super
  end

  # Triggered when user sends data to log in form.
  def create
    @user = User.find(current_user.id)
    logger.info "@user logged in : #{@user.attributes}"
    # Prevents a de-activated account user to log in.
    if @user.is_active == 0
      flash.now.alert = "This user account has been de-activated."
      render 'new' and return
    else
      super
    end
  end

  # Triggered when user sends data to log out.
  def destroy
    super
  end
end
