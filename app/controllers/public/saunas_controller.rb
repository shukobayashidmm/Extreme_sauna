class Public::SaunasController < ApplicationController
    
    def index
        @saunas = Sauna.page(params[:page])
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
