class ForecastsController < ApplicationController

	def index
		@forecast = Forecast.from_hash(forecast_params)
	end

	def new
		@forecast = Forecast.new
	end

  def create
  	@forecast = Forecast.new
    @forecast.city = params[:forecast][:city]
    @forecast.state = params[:forecast][:state]	

    
 
    @forecast.get_weather

  end

  private
    def forecast_params
    	params.permit(:city, :state)
    end
end