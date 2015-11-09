class GrupoEstoquesController < ApplicationController
  before_action :set_grupo_estoque, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  # GET /grupo_estoques
  # GET /grupo_estoques.json
  def index
    @grupo_estoques = GrupoEstoque.all
  end

  # GET /grupo_estoques/1
  # GET /grupo_estoques/1.json
  def show
    @q = GrupoEstoque.ransack(params[:q])
    @grupo_estoques = @q.result
  end

  # GET /grupo_estoques/new
  def new
    @q = GrupoEstoque.ransack(params[:q])
    @grupo_estoques = @q.result
    @grupo_estoque = GrupoEstoque.new
  end

  # GET /grupo_estoques/1/edit
  def edit
    @q = GrupoEstoque.ransack(params[:q])
    @grupo_estoques = @q.result
  end

  # POST /grupo_estoques
  # POST /grupo_estoques.json
  def create
    @grupo_estoque = GrupoEstoque.new(grupo_estoque_params)

    respond_to do |format|
      if @grupo_estoque.save
        format.html { redirect_to action: "new", notice: 'Grupo estoque was successfully created.' }
        format.json { render :show, status: :created, location: @grupo_estoque }
      else
        format.html { render :new }
        format.json { render json: @grupo_estoque.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grupo_estoques/1
  # PATCH/PUT /grupo_estoques/1.json
  def update
    respond_to do |format|
      if @grupo_estoque.update(grupo_estoque_params)
        format.html { redirect_to action: "new", notice: 'Grupo estoque was successfully updated.' }
        format.json { render :show, status: :ok, location: @grupo_estoque }
      else
        format.html { render :edit }
        format.json { render json: @grupo_estoque.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grupo_estoques/1
  # DELETE /grupo_estoques/1.json
  def destroy
    @grupo_estoque.destroy
    respond_to do |format|
      format.html { redirect_to action: "new", notice: 'Grupo estoque was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grupo_estoque
      @grupo_estoque = GrupoEstoque.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grupo_estoque_params
      params.require(:grupo_estoque).permit(:nome, :descricao_loga)
    end
end
