module Api
    

class InsumosController < ApplicationController
 respond_to :json
   
# GET /pedidos
  # GET /pedidos.json
  def index
    respond_with Insumo.all

  end

  # GET /pedidos/1
  # GET /pedidos/1.json
  def show
     respond_with Insumo.find(params[:id])
  end


  # GET /pedidos/1/edit
  def edit
  end
  
  

  # POST /pedidos
  # POST /pedidos.json
  def create
     respond_with Insumo.create(insumo_params)
  end

  # PATCH/PUT /pedidos/1
  # PATCH/PUT /pedidos/1.json
  def update
   respond_with Insumo.update(params[:id], insumo_params)
  end

  # DELETE /pedidos/1
  # DELETE /pedidos/1.json
  def destroy
    respond_with Insumo.destroy(params[:id])
  end

  
    def insumo_params
      params.require(:insumo).permit(:descricao, :quantidade, :unid_med)
    end
end
end