module Api
    
    class ItensPedidosController < ApplicationController
      respond_to :json
      
      # GET /itens_pedidos
      # GET /itens_pedidos.json
      def index
       
        respond_with ItensPedido.all
        

      end

      # GET /itens_pedidos/1
      # GET /itens_pedidos/1.json
      def show
         respond_with ItensPedido.find(params[:id])

      end

      # POST /itens_pedidos
      # POST /itens_pedidos.json
      def create
        
        respond_with ItensPedido.create(itens_pedido_params)
      
      end

      # PATCH/PUT /itens_pedidos/1
      # PATCH/PUT /itens_pedidos/1.json
      def update
        respond_with ItensPedido.update(params[:id], params[:itens_pedido])
       
      end

      # DELETE /itens_pedidos/1
      # DELETE /itens_pedidos/1.json
      def destroy
        respond_with ItensPedido.destroy(params[:id])
    
      
      end

      def delete
        respond_with ItensPedido.destroy(params[:id])
    
      
      end

      def itens_pedido_params
      params.require(:itens_pedido).permit(:estoque_id, :pedido_id, :quantidade)
    end

    end
end