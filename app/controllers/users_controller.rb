class UsersController < ApplicationController
  def show
    user = User.find_by(id: params[:id])
    if user
      render json: {data: user}, status: 200
    else
      render json: {data: "No user found"}, status: 404
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: {data: user}, status: 200
    else
      render json: {data: "User cannot be created"}, status: 500
    end
  end

  private

  def user_params
    params.permit(:name)
  end
end
