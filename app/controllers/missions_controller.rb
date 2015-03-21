class MissionsController < ApplicationController
	#before_action :login_required

  def index
  	@missions = Mission.all
  end

  def show
  	@mission = Mission.find(params[:id])
  end

  def new
  	@mission = Mission.new
  end

  def create
  	@mission = Mission.new(missions_params)
    if @mission.save
      redirect_to missions_path, notice: "Super bien!"
    else
      render "new"
    end  
  end

  private

  def missions_params
  	params.require(:mission).permit(:title, :content, :points, :take_mission, :begin_date, :final_date)
  end
end

