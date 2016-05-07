module Api
    

class EstoquesController < ApplicationController
 respond_to :json
   
  # GET /pedidos
  # GET /pedidos.json
  def index
    respond_with Estoque.all

  end

  # GET /pedidos/1
  # GET /pedidos/1.json
  def show
     respond_with Estoque.find(params[:id])
  end


  # GET /pedidos/1/edit
  def edit
  end
  
  

  # POST /pedidos
  # POST /pedidos.json
  def create
     respond_with Estoque.create(pedido_params)
  end

  # PATCH/PUT /pedidos/1
  # PATCH/PUT /pedidos/1.json
  def update
   respond_with Estoque.update(params[:id], pedido_params)
  end

  # DELETE /pedidos/1
  # DELETE /pedidos/1.json
  def destroy
    respond_with Estoque.destroy(params[:id])
  end

  def delete
     respond_with ItensPedido.destroy(params[:id])
    
      
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pedido_params
      params.require(:estoque).permit(:id, :quantidade)
    end
end

end