class FornecedorsController < ApplicationController
  before_action :set_fornecedor, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /fornecedors
  # GET /fornecedors.json
  def index
    @fornecedors = Fornecedor.all
    @q = Fornecedor.ransack(params[:q])
    @fornecedor = @q.result
    authorize @fornecedor
  end

  # GET /fornecedors/1
  # GET /fornecedors/1.json
  def show
    @q = Fornecedor.ransack(params[:q])
    @fornecedors = @q.result
   
  end

  # GET /fornecedors/new
  def new
    @q = Fornecedor.ransack(params[:q])
    @fornecedors = @q.result
    @fornecedor = Fornecedor.new
    authorize @fornecedor
    #@fornecedors = Fornecedor.all
  end

  # GET /fornecedors/1/edit
  def edit
    @q = Fornecedor.ransack(params[:q])
    @fornecedors = @q.result
  end

  # POST /fornecedors
  # POST /fornecedors.json
  def create
    @fornecedor = Fornecedor.new(fornecedor_params)

    respond_to do |format|
      if @fornecedor.save
        format.html { redirect_to action: "new", notice: 'Criado com sucesso!' }
        format.json { render :show, status: :created, location: @fornecedor }
      else
        format.html { render :new }
        format.json { render json: @fornecedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fornecedors/1
  # PATCH/PUT /fornecedors/1.json
  def update
    respond_to do |format|
      if @fornecedor.update(fornecedor_params)
        format.html { redirect_to action: "new", notice: 'Atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @fornecedor }
      else
        format.html { render :edit }
        format.json { render json: @fornecedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fornecedors/1
  # DELETE /fornecedors/1.json
  def destroy
    @fornecedor.destroy
    respond_to do |format|
      format.html { redirect_to action: "new", notice: 'Excluido com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fornecedor
      @fornecedor = Fornecedor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fornecedor_params
      params.require(:fornecedor).permit(:razao_social, :nome_fantasia, :endereco, :bairro, :cep, :cep, :cidade, :tel1, :tel2)
    end
end
