class FabricantesController < ApplicationController
  before_action :set_fabricante, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  

  def index
    @q = Fabricante.ransack(params[:q])
    @fabricantes = @q.result
    authorize @fabricantes
  end

  def show
  end

  def new
    @fabricante = Fabricante.new
  end

  def edit
  end

  def create
    @fabricante = Fabricante.new(fabricante_params)

    respond_to do |format|
      if @fabricante.save
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @fabricante.errors.full_messages, 
          status: :unprocessable_entity }
        end

      end
    end

  def update
     respond_to do |format|
      if @fabricante.update(fabricante_params)
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @fabricante.errors.full_messages,
                                   status: :unprocessable_entity }
      end
     
    end
  end


  def destroy
    @fabricante.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end


  private
    def set_fabricante
      @fabricante = Fabricante.find(params[:id])
    end

    def fabricante_params
      params.require(:fabricante).permit(:nome, :tel1, :tel2)
    end
  end
