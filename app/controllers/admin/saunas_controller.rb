class Admin::SaunasController < ApplicationController
    
    
    def index
        @saunas = Sauna.all
    end
    
    def new
        @sauna = Sauna.new  
    end
    
    
    def create
        sauna = Sauna.new(sauna_params)
        sauna.save
        redirect_to admin_saunas_path
    end
    
    def show
        @sauna = Sauna.find(params[:id])
    end
    
    
    def edit
        @sauna = Sauna.find(params[:id])
    end
    
    def update
        sauna = Sauna.find(params[:id])
        sauna.update(sauna_params)
        redirect_to admin_saunas_show_path
    end
    
    def destroy
        sauna = Sauna.find(params[:id])
        sauna.destroy
        redirect_to admin_saunas_path
    end
    
    def search
        @q = Sauna.ransack(params[:q])
    end
    
    def result
       @q = Sauna.ransack(params[:q])
       @results = @q.result
    end
    
    private
  def sauna_params
    params.require(:sauna).permit(:name, :price, :business_hour, :room_temperature, :water_temperature, :prefecture, 
    :address, :latitude, :longitude, :image)
  end
end
