class SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:email])
    if user
      if user.authenticate(params[:password])
        render json: user, serializer: UserSerializer, status: 201
      else
        render json:
          {
            message: I18n.t('controllers.sessions.wrong_password')
          }, status: 404
      end
    else
      render json:
        { message: I18n.t('controllers.sessions.no_user_found') }, status: 404
    end
  end
end
