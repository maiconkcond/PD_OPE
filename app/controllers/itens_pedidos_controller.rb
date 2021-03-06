class ItensPedidosController < ApplicationController
  before_action :set_itens_pedido, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  
  # GET /itens_pedidos
  # GET /itens_pedidos.json
  def index
    @itens_pedidos = ItensPedido.all
 
     #respond_with @itens_pedidos

  end

  def litar_item_pedido
    @itens_pedidos_find = ItensPedido.where("pedido_id ="+params[:id])
    
  end

  # GET /itens_pedidos/1
  # GET /itens_pedidos/1.json
  def show
     respond_with ItensPedido.find(params[:id])

       end

  # GET /itens_pedidos/new
  def new
    @itens_pedido = ItensPedido.new
    
  end

  # GET /itens_pedidos/1/edit
  def edit
  end

  

  # POST /itens_pedidos
  # POST /itens_pedidos.json
  def create

    #respond_with ItensPedido.create(params[:itens_pedido])

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

  # PATCH/PUT /itens_pedidos/1
  # PATCH/PUT /itens_pedidos/1.json
  def update
    
    respond_to do |format|
      if @itens_pedido.update(itens_pedido_params)
        format.html { redirect_to @itens_pedido, notice: 'Itens pedido was successfully updated.' }
        format.json { render :show, status: :ok, location: @itens_pedido }
      else
        format.html { render :edit }
        format.json { render json: @itens_pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /itens_pedidos/1
  # DELETE /itens_pedidos/1.json
  def destroy
   
    @itens_pedido.destroy
    respond_to do |format|
      format.html { redirect_to itens_pedidos_url, notice: 'Itens pedido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_itens_pedido
      @itens_pedido = ItensPedido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def itens_pedido_params
      params.require(:itens_pedido).permit(:estoque_id, :pedido_id)
    end


end
