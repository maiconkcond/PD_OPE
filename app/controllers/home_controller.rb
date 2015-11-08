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

def new
	@client2 = Client.new
	@pedido = Pedido.all
  	@pedido2 = Pedido.new
    @q = Client.ransack(params[:q])
    @clients = @q.result
    @client = Client.new
    #@clients = Client.all
    @grupo_estoques = GrupoEstoque.new
    @grupo_estoques2 = GrupoEstoque.all
    @estoque = Estoque.new
    @estoque2 = Estoque.where("grupo_estoque_id=?", GrupoEstoque.first.id)
  end


def json
   
   @estoque = Estoque.where("grupo_estoque_id="+params[:id])

 
   render json: @estoque
  
   
 end

 def jsonValor
   
   @estoque = Estoque.find(params[:id])
 
   render json: @estoque

 end
 
end
