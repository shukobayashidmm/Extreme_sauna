class Public::UsersController < ApplicationController
    before_action :authenticate_user!
    
    def show
        @user = current_user
    end
    
    def edit
        @user = current_user
        if @user.email == "guest@example.com"
        render :show
        end
    end
    
    def update
        @user = current_user
        if @user.update(user_params)
           redirect_to public_users_my_page_path
        else
           redirect_to request.referer
        end
    end
    
    def unsubscribe
        @user = current_user
        if @user.email == "guest@example.com"
          render :show
        end
    end
    
    def destroy
        user = current_user
        user.destroy
        redirect_to root_path
    end
    
    
    private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address,
     :telephone_number, :birthday, :email)
  end
end
