# Payments Controller class
class PaymentsController < ApplicationController
  def index
    payments = Payment.all
    render json: payments, status: 200
  end

  def create
    manager = PaymentManager.new
    if manager.pay(payment_params)
      render json:
        { message: I18n.t('controllers.payments.payment_succces') },
             status: 201
    else
      render json:
        { message: I18n.t('controllers.payments.payment_error') },
             status: 404
    end
  end

  private

  def payment_params
    params.permit(
      :soat_insurance_id,
      :credit_card_number,
      :credit_card_owner_name,
      :expiration_date,
      :security_code,
      :number_of_dues
    )
  end
end
