class Public::CommentsController < ApplicationController
    
    def create
    end
    
    def show
        @review = Review.find(params[:review_id])
        @comment = Comment.all
    end
    
    def edit
    end
    
    def destroy
    end
end
