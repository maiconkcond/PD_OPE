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


    @itens_pedido = ItensPedido.new(itens_pedido_params)
    idped = Pedido.all.last
    @itens_pedido.pedido_id=idped

    respond_to do |format|
      if @itens_pedido.save
        format.html { redirect_to "http://localhost:3000" }
        
      else
        format.html { render :new }
        format.json { render json: @itens_pedido.errors, status: :unprocessable_entity }
      end
    end
  end




def json
   
   @estoque = Estoque.where("grupo_estoque_id="+params[:id])
   render json: @estoque
  
   
 end

 def jsonValor
   
   @estoque = Estoque.find(params[:id])
   render json: @estoque

 end
 

 def itens_pedido_params
      params.require(:itens_pedido).permit(:estoque_id, :pedido_id)
    end


end
