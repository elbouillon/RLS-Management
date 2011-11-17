class UsersController < InheritedResources::Base
  #before_filter :find_user, :only => [:show]
  load_and_authorize_resource

  def find_user
    @user = User.find(current_user.id)
  end

  def show
    show! do
      unless @user.complete?
        redirect_to edit_user_path(@user)
        return
      end
    end
  end

end
