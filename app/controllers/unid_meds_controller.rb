class UnidMedsController < ApplicationController
  before_action :set_unid_med, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  # GET /unid_meds
  # GET /unid_meds.json
  def index
    @unid_meds = UnidMed.all
    authorize @unid_meds
  end

  # GET /unid_meds/1
  # GET /unid_meds/1.json
  def show
  end

  # GET /unid_meds/new
  def new
    @unid_med = UnidMed.new
    authorize @unid_med
  end

  # GET /unid_meds/1/edit
  def edit
  end

  # POST /unid_meds
  # POST /unid_meds.json
  def create
    @unid_med = UnidMed.new(unid_med_params)

    respond_to do |format|
      if @unid_med.save
        format.html { redirect_to @unid_med, notice: 'Unid med was successfully created.' }
        format.json { render :show, status: :created, location: @unid_med }
      else
        format.html { render :new }
        format.json { render json: @unid_med.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unid_meds/1
  # PATCH/PUT /unid_meds/1.json
  def update
    respond_to do |format|
      if @unid_med.update(unid_med_params)
        format.html { redirect_to @unid_med, notice: 'Unid med was successfully updated.' }
        format.json { render :show, status: :ok, location: @unid_med }
      else
        format.html { render :edit }
        format.json { render json: @unid_med.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unid_meds/1
  # DELETE /unid_meds/1.json
  def destroy
    @unid_med.destroy
    respond_to do |format|
      format.html { redirect_to unid_meds_url, notice: 'Unid med was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unid_med
      @unid_med = UnidMed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unid_med_params
      params.require(:unid_med).permit(:descricao, :abreviacao)
    end
end
