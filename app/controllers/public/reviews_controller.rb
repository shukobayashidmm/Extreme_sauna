class Public::ReviewsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @sauna = Sauna.find(params[:sauna_id])
        @reviews = @sauna.reviews.includes(:user).all
        @review  = @sauna.reviews.build(user_id: current_user.id) if current_user
    end
    
    def new
        @sauna = Sauna.find(params[:sauna_id])
        @review = Review.new
    end
    
    def create
        @sauna = Sauna.find(params[:sauna_id])
        review = current_user.reviews.new(review_params)
        review.sauna_id = @sauna.id
        if review.save
           redirect_to public_sauna_reviews_path
        else
           redirect_to request.referer
        end
    end
    
    
    def edit
          @sauna = Sauna.find(params[:sauna_id])
          @review = Review.find(params[:id])
         if @review.user == current_user
            render :edit
         else
            redirect_to public_sauna_reviews_path
         end
    end
    
    def update
        @user = current_user.id
        @sauna = Sauna.find(params[:sauna_id])
        review = Review.find(params[:id])
        if  review.update(review_params)
            redirect_to public_sauna_reviews_path
        else
            redirect_to request.referer
        end
    end
    
    def destroy
        review = Review.find(params[:id])
        review.destroy
        redirect_to public_sauna_reviews_path
    end
    
    private

  def review_params
    params.require(:review).permit(:user_id, :content, :star)
  end
end
