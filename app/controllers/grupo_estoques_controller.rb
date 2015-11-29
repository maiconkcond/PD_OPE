class GrupoEstoquesController < ApplicationController
before_action :set_grupo_estoque, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  def index
    @q = GrupoEstoque.ransack(params[:q])
    @grupo_estoques = @q.result
    authorize @grupo_estoques
  end

  def show
  end

  def new
    @grupo_estoque = GrupoEstoque.new
  end

  def create
    @grupo_estoque = GrupoEstoque.create(grupo_estoque_params)

    respond_to do |format|
      if @grupo_estoque.save
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @grupo_estoque.errors.full_messages, 
                            status: :unprocessable_entity }
      end
      
    end
  end

  def edit
  end

  def update
     respond_to do |format|
      if @grupo_estoque.update(grupo_estoque_params)
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @grupo_estoque.errors.full_messages,
                                   status: :unprocessable_entity }
      end
     
    end
  end


  def destroy

    @grupo_estoque.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

private
  
  def set_grupo_estoque
    @grupo_estoque = GrupoEstoque.find(params[:id])
  end
  
  def grupo_estoque_params
    params.require(:grupo_estoque).permit(:nome, :descricao_loga)
  end
end
