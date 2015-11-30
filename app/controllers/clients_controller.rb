class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  # GET /clients
  # GET /clients.json
  def index
    @q = Client.ransack(params[:q])
    @clients = @q.result
    @clients = Client.all
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    @q = Client.ransack(params[:q])
    @clients = @q.result
  end

  # GET /clients/new
  def new
    @q = Client.ransack(params[:q])
    @clients = @q.result
    @client = Client.new
    

  end

  # GET /clients/1/edit
  def edit
    @pedido = Pedido.new
    @pedido = Pedido.all
    @q = Client.ransack(params[:q])
    @clients = @q.result
     
  end

  # POST /clients
  # POST /clients.json
  def create
    @clients = Client.new(client_params)

    respond_to do |format|
      if @clients.save
        format.html { redirect_to action: "new", notice: 'Criado com sucesso!.' }
        format.json { render :show, status: :created, location: @clients }
      else
        #@clients = User.all #this is the important line
        #render :new
        format.html { render :new }
        format.json { render json: @clients.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to action: "new", notice: 'Atualizado!' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to action: "new", notice: 'Excluido com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:nome, :endereco, :complemento, :bairro, :cidade, :cep, :tel1, :tel2, :cel1, :cel2, :email, :obs)
    end
end
