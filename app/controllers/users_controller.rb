class UsersController < InheritedResources::Base
  load_and_authorize_resource

  custom_actions :resource => :current

  def show
    @user ||= User.find(current_user.id) unless params[:id]
    show! do
      if !@user.complete? && @user.id == current_user.id
        redirect_to edit_user_path(@user)
        return
      end
    end
  end

end
