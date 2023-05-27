class Admin::UsersController < ApplicationController
     before_action :authenticate_admin!
    
    
    def index
        @users = User.page(params[:page]).per(10)
        @user = User.all
    end
    
    def show
        @user = User.find(params[:id])
    end
    
    def edit
        @user = User.find(params[:id])
        if @user.email == "guest@example.com"
           render :show
        end
    end
    
    def update
        user = User.find(params[:id])
        if user.email == "guest@example.com"
           render :show
        else
          user.update(user_params)
          redirect_to admin_users_show_path
        end
    end
    
    def destroy
        user = User.find(params[:id])
        user.destroy
        redirect_to admin_users_path 
    end
    a
    
    
     private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address,
     :telephone_number, :birthday, :email)
  end
    
end
