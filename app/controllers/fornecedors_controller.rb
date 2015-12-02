class FornecedorsController < ApplicationController
  before_action :set_fornecedor, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  def index
    @q = Fornecedor.ransack(params[:q])
    @fornecedors = @q.result
    authorize @fornecedors
  end

  def show
  end

  def new
    @fornecedor = Fornecedor.new
  end

  def edit
  end

    def create
    @fornecedor = Fornecedor.new(fornecedor_params)

    respond_to do |format|
      if @fornecedor.save
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @fornecedor.errors.full_messages, 
                            status: :unprocessable_entity }
      end
      
    end
  end


  def update
     respond_to do |format|
      if @fornecedor.update(fornecedor_params)
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @fornecedor.errors.full_messages,
                                   status: :unprocessable_entity }
      end
     
    end
  end


  def destroy
    @fornecedor.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
    def set_fornecedor
      @fornecedor = Fornecedor.find(params[:id])
    end

    def fornecedor_params
      params.require(:fornecedor).permit(:razao_social, :nome_fantasia, :endereco, :bairro, :cep, :cep, :cidade, :tel1, :tel2)
    end
end
