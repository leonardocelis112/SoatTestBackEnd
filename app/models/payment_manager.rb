# Payment manager Class
class PaymentManager
  include ActiveModel::Model
  attr_accessor :success

  def pay(params)
    payment = Payment.new
    soat_insurance = SoatInsurance.find(params[:soat_insurance_id])
    payment = calculate_prices(payment, soat_insurance)
    if process_payment(params)
      payment.card_number = params[:credit_card_number]
      payment.save
      send_mail(payment)
      generate_pdf(payment)
      pay_soat_insurance(soat_insurance)
      true
    else
      false
    end
  end

  private

  def process_payment(payment_data)
    true
  end

  def send_mail(payment)
  end

  def generate_pdf(payment)
  end

  def pay_soat_insurance(soat_insurance)
    soat_insurance.paid = true
    soat_insurance.save
  end

  def calculate_prices(payment, soat_insurance)
    payment = fill_relationship_fields(payment, soat_insurance)
    payment.value = soat_insurance.vehicle_subtype.value
    payment.contribution = payment.value * 0.5
    payment.total = payment.value + payment.contribution + 1610
    payment
  end

  def fill_relationship_fields(payment, soat_insurance)
    payment.user = soat_insurance.user
    payment.soat_insurance = soat_insurance
    payment
  end
end
