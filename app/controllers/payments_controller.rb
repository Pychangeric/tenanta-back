class PaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_payment, only: [:create]

  def new
    @payment = current_user.payments.build
  end

  def create
    @payment = current_user.payments.build(payment_params)
    if @payment.save
      mpesa_payment = Mpesa::Payment.create_payment(
        amount: @payment.amount,
        phone_number: @payment.phone_number,
        callback_url => 'http://your-placeholder-url.com/payments/callback'
        )

      # Process the Mpesa payment response and update the payment status
      if mpesa_payment.success?
        @payment.update(mp_transaction_id: mpesa_payment.transaction_id, status: 'paid')
        current_user.update(confirmed_at: Time.zone.now) # Activate user account
        redirect_to new_user_session_path, notice: "Payment successful. Please sign in to continue."
      else
        # Handle payment failure
        @payment.update(status: 'failed')
        render :new
      end
    else
      render :new
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:amount, :phone_number)
  end

  def set_payment
    @payment = Payment.find(params[:id])
  end
end
