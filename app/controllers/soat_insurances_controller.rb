# Controller for Soat
class SoatInsurancesController < ApplicationController
  before_action :instanciate_user

  has_scope :not_outdated, type: :boolean
  has_scope :by_registration_plate

  def index
    soat_insurances = @user.soat_insurances
    render json: soat_insurances,
           each_serializer: SoatInsuranceSerializer, status: 200
  end

  def create
    soat_insurance = SoatInsurance.new(soat_insurance_params)
    if soat_insurance.save
      @user.soat_insurances << soat_insurance
      render json: soat_insurance,
             serializer: SoatInsuranceSerializer, status: 201
    else
      render json: soat_insurance.errors, status: 400
    end
  end

  private

  def soat_insurance_params
    params.permit(
      :vehicle_class_id,
      :vehicle_subtype_id,
      :registration_plate,
      :age,
      :number_of_passengers,
      :cilinder,
      :tons
    )
  end

  def instanciate_user
    @user = User.find(params[:user_id])
  end
end
