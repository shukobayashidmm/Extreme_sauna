class Public::ReviewsController < ApplicationController
    
    def index
        @sauna = Sauna.find(params[:sauna_id])
        @review = Review.all
    end
    
    def new
    end
    
    def create
    end
    
    def show
    end
    
    def edit
    end
    
    def update
    end
    
    def destroy
    end
    
    private

  def review_params
    params.require(:review).permit(:content)
  end
end
