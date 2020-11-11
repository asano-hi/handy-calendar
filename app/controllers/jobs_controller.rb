class JobsController < ApplicationController
  require 'date'

  def index
    @charts = current_user.schedules.where.not(workhours: nil).order(start_time: "ASC").page(params[:page]).per(4)
    @jobLists = current_user.jobs.all
    @workhours = current_user.schedules.where.not(workhours: nil).select(:start_time, :job_s_title, :workhours)
    @pay = current_user.jobs.joins(:schedules).select(:payment)

    if params[:search_date] == nil
      @monthPay = 0
    else
      @monthPay = current_user.schedules.where(start_time: params[:search_date].in_time_zone.all_month).sum(:workhours)
    end

    if params[:search_date] == nil
      @chart = current_user.schedules.where(start_time: 20000101)
    else
      @chart = @charts.where(start_time: params[:search_date].in_time_zone.all_month)
    end

  end

  def new
    @job = current_user.jobs.new
  end

  def show
    @job = current_user.jobs.find(params[:id])
  end

  def create
    job = current_user.jobs.new(job_parameter)
    if job.save
      redirect_to schedules_path
    else
      redirect_to new_job_path
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to jobs_path, notice:"削除しました"
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_parameter)
      redirect_to jobs_path, notice:"編集しました"
    else
      render 'edit'
    end
  end

  private

  def job_parameter
    params.require(:job).permit(:job_title, :payment, :user_id)
  end

end
