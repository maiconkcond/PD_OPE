class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  def index
    @q = Client.ransack(params[:q])
    @clients = @q.result
  end

  def show
  end

  def new
    @client = Client.new

  end

  def edit

    @pedido = Pedido.new
    @pedido = Pedido.all
    @q = Client.ransack(params[:q])
    @clients = @q.result
     

  end

  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @client.errors.full_messages, 
                            status: :unprocessable_entity }
      end
      
    end
  end

  def update
     respond_to do |format|
      if @client.update(client_params)
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @client.errors.full_messages,
                                   status: :unprocessable_entity }
      end
     
    end
  end

  def destroy
    @client.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
    
    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:nome, :endereco, :complemento, :bairro, :cidade, :cep, :tel1, :tel2, :cel1, :cel2, :email, :obs)
    end
end
