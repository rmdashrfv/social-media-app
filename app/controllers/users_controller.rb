class UsersController < ApplicationController

  def login
    # in every single request, there exists the params hash
    user = User.find_by!(email: params[:email])
    if user && user.password_digest == params[:password]
      render json: user, status: :ok
    else
      render json: {error: 'Invalid email password'}, status: 404
    end
  end
end