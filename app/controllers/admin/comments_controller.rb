class Admin::CommentsController < ApplicationController
    
    def index
        @review = Review.find(params[:review_id])
        @comments = @review.comments
    end
    
    
    def destroy
        review = Review.find(params[:review_id])
        comment = review.comments.find(params[:id])
        comment.destroy
        redirect_to admin_comments_index_path
    end
end
