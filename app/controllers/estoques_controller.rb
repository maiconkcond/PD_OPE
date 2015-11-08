class EstoquesController < ApplicationController
  before_action :set_estoque, only: [:show, :edit, :update, :destroy]

  # GET /estoques
  # GET /estoques.json
  def index
    @estoques = Estoque.all
  end

  # GET /estoques/1
  # GET /estoques/1.json
  def show
  end

  # GET /estoques/new
  def new
    @estoque = Estoque.new
  end

  # GET /estoques/1/edit
  def edit
  end

  # POST /estoques
  # POST /estoques.json
  def create
    @estoque = Estoque.new(estoque_params)

    respond_to do |format|
      if @estoque.save
        format.html { redirect_to @estoque, notice: 'Estoque was successfully created.' }
        format.json { render :show, status: :created, location: @estoque }
      else
        format.html { render :new }
        format.json { render json: @estoque.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estoques/1
  # PATCH/PUT /estoques/1.json
  def update
    respond_to do |format|
      if @estoque.update(estoque_params)
        format.html { redirect_to @estoque, notice: 'Estoque was successfully updated.' }
        format.json { render :show, status: :ok, location: @estoque }
      else
        format.html { render :edit }
        format.json { render json: @estoque.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estoques/1
  # DELETE /estoques/1.json
  def destroy
    @estoque.destroy
    respond_to do |format|
      format.html { redirect_to estoques_url, notice: 'Estoque was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estoque
      @estoque = Estoque.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estoque_params
      params.require(:estoque).permit(:nome, :fabricante_id, :fornecedor_id, :grupo_estoque_id, :cod_barras, :quantidade, :unid_medida, :qtd_minima, :valor_custo, :margem_lucro, :valor_venda, :insumo1, :qtd_insumo1, :med_ins1, :insumo2, :qtd_insumo2, :med_ins2, :insumo3, :qtd_insumo3, :med_ins3, :insumo4, :qtd_insumo4, :med_ins4, :insumo5, :qtd_insumo5, :med_ins5, :insumo6, :qtd_insumo6, :med_ins6, :insumo7, :qtd_insumo7, :med_ins7, :insumo8, :qtd_insumo8, :med_ins8, :obs)
    end
end
