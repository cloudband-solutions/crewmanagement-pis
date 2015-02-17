module Account
  class UsersController < ApplicationController
    before_filter :authenticate_user!

    def show
    end

    def edit
    end

    def update

      if current_user.update(user_params)
        flash[:success] = "Successfully updated profile"
        redirect_to root_path
      else
        flash.now[:error] = "Cannot save user"
        render :edit
      end
    end

    def user_params
      params.require(:user).permit!
    end
  end
end
