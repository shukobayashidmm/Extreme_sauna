class Public::SaunasController < ApplicationController
    
    def index
        @saunas = Sauna.all
    end
    
    def show
        @sauna = Sauna.find(params[:id])
    end
    
    def search
    end
    
    def result
    end
    
    def map
    end
end
