class UnidMedsController < ApplicationController
  before_action :set_unid_med, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  def index
    @q = UnidMed.ransack(params[:q])
    @unid_meds = @q.result
    authorize @unid_meds
    
  end

  def show
  end

  def new
    @unid_med = UnidMed.new
  end

  def create
    @unid_med = UnidMed.create(unid_med_params)

    respond_to do |format|
      if @unid_med.save
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @unid_med.errors.full_messages, 
                            status: :unprocessable_entity }
      end
      
    end
  end

  def edit
  end

  def update
     respond_to do |format|
      if @unid_med.update(unid_med_params)
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @unid_med.errors.full_messages,
                                   status: :unprocessable_entity }
      end
     
    end
  end


  def destroy

    @unid_med.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

private
  
  def set_unid_med
    @unid_med = UnidMed.find(params[:id])
  end
  
  def unid_med_params
    params.require(:unid_med).permit(:descricao, :abreviacao)
  end
end
