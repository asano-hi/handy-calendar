class SchedulesController < ApplicationController
  before_action :authenticate_user!
  require 'date'

  def index
    @schedules = current_user.schedules.all.order(start_time: "DESC").page(params[:page]).per(5)

  end

  def new
    @schedule = Schedule.new
  end

  def show
    @schedule = current_user.schedules.find(params[:id])
  end

  def create
    @schedule = Schedule.new(schedule_parameter)
    @schedule.user_id = current_user.id
    if @schedule.save
      redirect_to schedules_path
    else
      redirect_to new_schedule_path
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    redirect_to schedules_path, notice:"削除しました"
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_parameter)
      redirect_to schedules_path, notice:"編集しました"
    else
      render 'edit'
    end
  end


  private

  def schedule_parameter
    params.require(:schedule).permit(:event_title, :job_title, :memo, :start_time, :end_time, :workhours, :user_id)
  end

  
end
