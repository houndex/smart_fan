class FansController < ApplicationController
	def index
  	@fans = Fan.all
  end

  def show
  	@fan = Fan.find(params[:id])
  end
end