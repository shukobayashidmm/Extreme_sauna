class Public::SaunasController < ApplicationController
    before_action :authenticate_user!
    
    
    def index
        @saunas = Sauna.page(params[:page])
        @sauna = Sauna.all
    end
    
    def show
        @sauna = Sauna.find(params[:id])
    end
    
    def search
        @q = Sauna.ransack(params[:q])
    end
    
    def result
       @q = Sauna.ransack(params[:q])
       @results = @q.result
    end
    
    def map
        @sauna = Sauna.find(params[:id])
    end
    
     
end
