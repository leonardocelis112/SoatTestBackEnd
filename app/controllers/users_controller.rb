# Class for manage sessions
class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: user, serializer: UserSerializer, status: 201
    else
      render json: user.errors, status: 400
    end
  end

  def update
    user = User.find(params[:id])
    if user.update_attributes(user_params)
      render json: user, serializer: UserSerializer, status: 201
    else
      render json: user.errors, status: 400
    end
  end

  private

  def user_params
    params.permit(
      :first_name,
      :last_name,
      :telephone,
      :password,
      :email,
      :document_number,
      :document_type
    )
  end
end
