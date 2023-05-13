class Admin::ReviewsController < ApplicationController
    before_action :authenticate_admin!
    
    
    def index
        @sauna = Sauna.find(params[:sauna_id])
        @reviews = @sauna.reviews.includes(:user).all
    end
    
    def destroy
        @sauna = Sauna.find(params[:sauna_id])
        reviews = Review.find(params[:id])
        reviews.destroy
        redirect_to admin_reviews_index_path
    end
    
    
    
    
    
    
private

  def review_params
    params.require(:review).permit(:user_id, :content)
  end

end
