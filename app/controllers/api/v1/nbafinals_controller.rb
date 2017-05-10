class Api::V1::NbafinalsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    nbafinal_years = Nbafinal.all.pluck(:year)
    render json: nbafinal_years
  end

  def show
    nbafinal = Nbafinal.where(year: params[:id])
    render json: nbafinal
  end

  def create
    body = request.body.read
    parsed = JSON.parse(body)
    nbafinal = Nbafinal.new(parsed)
    if nbafinal.save
      render json: { message: ["It worked!"] }
    else
      render json: { message: nbafinal.errors.full_messages }
    end
  end
end
