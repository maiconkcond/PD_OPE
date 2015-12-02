class FuncionariosController < ApplicationController
  before_action :set_funcionario, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  

  def index
   @q = Funcionario.ransack(params[:q])
    @funcionarios = @q.result
    authorize @funcionarios
  end

  def show
  end

  def new
    @funcionario = Funcionario.new
  end

  def edit
  end

  def create
    @funcionario = Funcionario.new(funcionario_params)

    respond_to do |format|
      if @funcionario.save
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @funcionario.errors.full_messages, 
                            status: :unprocessable_entity }
      end
      
    end
  end

  def update
     respond_to do |format|
      if @funcionario.update(funcionario_params)
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @funcionario.errors.full_messages,
                                   status: :unprocessable_entity }
      end
     
    end
  end

  def destroy
    @funcionario.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
    def set_funcionario
      @funcionario = Funcionario.find(params[:id])
    end

    def funcionario_params
      params.require(:funcionario).permit(:nome, :cargo, :salario, :comissao, :endereco, :cep, :tel, :cel)
    end
end
