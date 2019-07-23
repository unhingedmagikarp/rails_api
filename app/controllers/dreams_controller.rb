class UsersController < ApplicationController
  def index
    dreams = Dream.all
    if dreams
      render json: {data: dreams}, status: 200
    else
      render json: {data: 'No dreams found'}, status: 404
    end
  end
  
  def show
    dream = Dream.find_by(id: params[:id])
    if dream
      render json: {data: dream}, status: 200
    else
      render json: {data: "No dream found"}, status: 404
    end
  end

  def create
    dream = Dream.new(dream_params)
    if dream.save
      render json: {data: dream}, status: 200
    else
      render json: {data: "Dream cannot be created"}, status: 500
    end
  end
  
  def update
    dream = Dream.find_by(id: params[:id])
    if dream.update(dream_params) and dream.save
      render json: {data: dream}, status: 200
    else
      render json: {data: 'Error while updating dream'}, status: 500
    end
  end
  
  def destroy
    if Dream.find_by(id: params[:id]).destroy
      render json: {data: 'Dream deleted'}, status: 200
    else
      render json: {data: 'Dream cannot be deleted'}
    end
  end

  private

  def dream_params
    params.permit(:title, :description, :highlight, :user_id)
  end
end
  