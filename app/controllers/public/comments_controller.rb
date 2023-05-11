class Public::CommentsController < ApplicationController
    
    def create
        review = Review.find(params[:review_id])
        comment = Comment.new(comment_params)
        comment.review_id = review.id
        comment.user_id = current_user.id
        comment.save
        redirect_to public_comments_show_path(id: comment.review_id)
        
    end
    
    def show
        @review = Review.find(params[:review_id])
        @comments = @review.comments
        @comment = Comment.new
    end
    
    def edit
        @review = Review.find(params[:review_id])
        @comment = Comment.find(params[:id])
    end
    
    def update
        review = Review.find(params[:review_id])
        comment = Comment.find(params[:id])
        comment.update(comment_params)
        redirect_to public_comments_show_path(id: comment.id, review_id: review.id)
    end
    
    def destroy
        @review = Review.find(params[:review_id])
        comment = Comment.find(params[:id])
        comment.destroy
        redirect_to request.referer
    end
    
    
    private
    
    def comment_params
        params.require(:comment).permit(:content, :image)
    end
    
end