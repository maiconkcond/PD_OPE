module Api

class ItensCaixasController < ApplicationController

 respond_to :json
      
      # GET /itens_pedidos
      # GET /itens_pedidos.json
      def index
       
        respond_with ItensCaixa.all
        

      end

      # GET /itens_pedidos/1
      # GET /itens_pedidos/1.json
      def show
         respond_with ItensCaixa.find(params[:id])

      end

      # POST /itens_pedidos
      # POST /itens_pedidos.json
      def create
        
        respond_with ItensCaixa.create(itens_caixa_params)
      
      end

      # PATCH/PUT /itens_pedidos/1
      # PATCH/PUT /itens_pedidos/1.json
      def update
        respond_with ItensCaixa.update(params[:id], itens_caixa_params)
       
      end

      # DELETE /itens_pedidos/1
      # DELETE /itens_pedidos/1.json
      def destroy
        respond_with ItensCaixa.destroy(params[:id])
    
      
      end

      def delete
        respond_with ItensCaixa.destroy(params[:id])
    
      
      end

      def itens_caixa_params
      params.require(:itens_caixa).permit(:total, :id_forma_pagamento, :id_caixas)
    end


end
end	