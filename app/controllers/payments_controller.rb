class PaymentsController < ApplicationController
	before_action :set_payment, only: [:show, :edit, :update, :destroy]
  
  def index
  	@q = Payment.ransack(params[:q])
    @payments = @q.result
    
  end

  def show
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.create(payment_params)

    respond_to do |format|
      if @payment.save
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @payment.errors.full_messages, 
                            status: :unprocessable_entity }
      end
      
    end
  end

  def edit
  end

  def update
     respond_to do |format|
      if @payment.update(payment_params)
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @payment.errors.full_messages,
                                   status: :unprocessable_entity }
      end
     
    end
  end


  def destroy

    @payment.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

private
  
  def set_payment
  	@payment = Payment.find(params[:id])
  end
  
  def payment_params
    params.require(:payment).permit(:descricao)
  end

end
