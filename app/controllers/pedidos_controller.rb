class PedidosController < ApplicationController
  before_action :set_pedido, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  # GET /pedidos
  # GET /pedidos.json
  def index
    @pedidos = Pedido.all
    
  end

  # GET /pedidos/1
  # GET /pedidos/1.json
  def show
  end

  # GET /pedidos/new
  def new
    @pedido = Pedido.new
    @itens_pedido = ItensPedido.new
  end

  # GET /pedidos/1/edit
  def edit
  end
  
  def status
    @pedido = Pedido.find(params[:id])
    @pedido.status = 2
    
    respond_to do |format|
      if @pedido.save
        format.html { redirect_to "http://localhost:3000/", notice: 'Pedido was successfully created.' }
        format.json { render :show, status: :created, location: @pedido }
      else
        format.html { render :new }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end

  end

  def cadastra

 @pedido = Pedido.new(pedido_params)
    @pedido.status=1

    respond_to do |format|
      if @pedido.save
        format.html { redirect_to @pedido, notice: 'Pedido was successfully created.' }
        format.json { render :show, status: :created, location: @pedido }
      else
        format.html { render :new }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end

    id= Pedido.last

    @itens_pedido = ItensPedido.new(itens_pedido_params)
    @itens_pedido.pedido_id = id

    respond_to do |format|
      if @itens_pedido.save
        format.html { redirect_to @itens_pedido, notice: 'Itens pedido was successfully created.' }
        format.json { render :show, status: :created, location: @itens_pedido }
      else
        format.html { render :new }
        format.json { render json: @itens_pedido.errors, status: :unprocessable_entity }
      end
    end

  end

  # POST /pedidos
  # POST /pedidos.json
  def create
    @pedido = Pedido.new(pedido_params)
    @pedido.status=1

    respond_to do |format|
      if @pedido.save
        format.html { redirect_to @pedido, notice: 'Pedido was successfully created.' }
        format.json { render :show, status: :created, location: @pedido }
      else
        format.html { render :new }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pedidos/1
  # PATCH/PUT /pedidos/1.json
  def update
    respond_to do |format|
      if @pedido.update(pedido_params)
        format.html { redirect_to @pedido, notice: 'Pedido was successfully updated.' }
        format.json { render :show, status: :ok, location: @pedido }
      else
        format.html { render :edit }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedidos/1
  # DELETE /pedidos/1.json
  def destroy
    @pedido.destroy
    respond_to do |format|
      format.html { redirect_to pedidos_url, notice: 'Pedido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido
      @pedido = Pedido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pedido_params
      params.require(:pedido).permit(:client_id, :status)
    end
end
