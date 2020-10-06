class SchedulesController < ApplicationController
  before_action :authenticate_user!
  require 'date'

  def index
    @schedules = current_user.schedules.all
    @lists = current_user.schedules.all.order(start_time: "DESC").page(params[:page]).per(5)

  end

  def new
    @schedule = Schedule.new
  end

  def show
    @schedule = current_user.schedules.find(params[:id])
  end

  def create
    current_user.schedules.create(schedule_parameter)
    @schedule = current_user.schedules.all
    render 'create.js.erb'
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
    params.permit(:event_title, :job_title, :memo, :start_time, :end_time, :workhours, :user_id)
  end


end
