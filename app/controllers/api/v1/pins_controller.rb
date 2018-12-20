class Api::V1::PinsController < ApplicationController

  #before_filter :check_auth
    before_action :basic_auth

  def index
    render json: Pin.all.order('created_at DESC')
  end

  def create
    pin = Pin.new(pin_params)
    if pin.save
      render json: pin, status: 201
    else
      render json: { errors: pin.errors }, status: 422
    end
  end

  private
  def pin_params
    params.require(:pin).permit(:title, :image_url)
  end

  # def check_auth
  #   authenticate_or_request_with_http_basic do |email,token|
  #     resource = User.find_by_email(email)
  #     if resource.api_token=token
  #       sign_in :user, resource
  #     end
  #   end
  # end

end