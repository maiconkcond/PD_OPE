class InsumosController < ApplicationController
  before_action :set_insumo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  def index
    @q = Insumo.ransack(params[:q])
    @insumos = @q.result
    authorize @insumos

  end

  def show
  end

  def new
    @insumo = Insumo.new
  end

  def edit
  end

  def create
    @insumo = Insumo.new(insumo_params)

    respond_to do |format|
      if @insumo.save
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @insumo.errors.full_messages, 
                            status: :unprocessable_entity }
      end
      
    end
  end


  def update
    respond_to do |format|
      if @insumo.update(insumo_params)
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @insumo.errors.full_messages,
                                   status: :unprocessable_entity }
      end
     
    end
  end

  def destroy
    @insumo.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
end

  private

    def set_insumo
      @insumo = Insumo.find(params[:id])
    end

    def insumo_params
      params.require(:insumo).permit(:descricao, :quantidade, :unid_med)
    end
end
