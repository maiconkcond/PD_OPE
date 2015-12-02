class HomeController < ApplicationController
  before_action :authenticate_user!

 

  def index
  	@pedido = Pedido.all
  	@pedido2 = Pedido.new
  	@q = Client.ransack(params[:q])
  	@itens_pedidos2 = ItensPedido.new
  	@client2 = Client.new
    @grupo_estoques = GrupoEstoque.new
     @grupo_estoques2 = GrupoEstoque.all
  
  end

 def teste
 end

def new
	  @client2 = Client.new

    @q = Client.ransack(params[:q])
    @clients = @q.result

    @client = Client.new

	  @pedido = Pedido.all
  	@pedido2 = Pedido.new
    
   
    #@clients = Client.all
    @grupo_estoques = GrupoEstoque.new
    @grupo_estoques2 = GrupoEstoque.all
    @estoque = Estoque.new
    @estoque2 = Estoque.where("grupo_estoque_id=?", GrupoEstoque.first.id)
  end


 def create

    respond_with ItensPedido.create(itens_pedido_params)

    
  end




def json
   
   @estoque = Estoque.where("grupo_estoque_id="+params[:id])
   render json: @estoque
  
   
 end

 def jsonValor
   
   @estoque = Estoque.find(params[:id])
   render json: @estoque

 end
 
 
 def salva
   @itens_pedido = ItensPedido.new
   #JSON.parse(params[:enviado])
   #@itens_pedido.nome=ActiveSupport::JSON.decode(params[:nome])
   #var pt=ActiveSupport::JSON.decode(params[:enviado])
   #render json: $prod
 end
 
 def show
 # @itens_pedido = ItensPedido.all

  #JSON.parse(params[:enviado])
  #render json: pt
   #@itens_pedido = ItensPedido.new
   #@itens_pedido.estoque_id=3
   #@itens_pedido.save
 end

 def create 
  
 end

def cadastra
    @itens_pedido = ItensPedido.new
    @pedido = Pedido.new
    @pedido.status=1
    @pedido.client_id=params[:id]
    @pedido.save
    

    idPed = Pedido.last
    @itens_pedido.pedido_id=idPed.id
    @itens_pedido.estoque_id=4
    respond_to do |format|
      if @itens_pedido.save
        format.html { redirect_to "http://localhost:3000" }
        
      else
        format.html { render :new }
        format.json { render json: @itens_pedido.errors, status: :unprocessable_entity }
      end
    end

  end

  # DELETE /pedidos/1
  # DELETE /pedidos/1.json
   def destroy
    @pedido.destroy
    respond_to do |format|
      format.html { redirect_to 'http://localhost:3000/', notice: 'Pedido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

 def itens_pedido_params
      params.require(:itens_pedido).permit(:estoque_id, :pedido_id)
    end


end
