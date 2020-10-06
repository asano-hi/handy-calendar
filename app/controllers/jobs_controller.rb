class JobsController < ApplicationController
  require 'date'

  def index
    @schedules = current_user.schedules.where.not(workhours: nil).order(start_time: "ASC").page(params[:page]).per(4)
    @pay = User.find(current_user.id)

    if params[:search_date] == nil
      @monthPay = 0
    else
      @monthPay = current_user.schedules.where(start_time: params[:search_date].in_time_zone.all_month).sum(:workhours)
    end

    if params[:search_date] == nil
      @chart = current_user.schedules.where(start_time: 20000101)
    else
      @chart = @schedules.where(start_time: params[:search_date].in_time_zone.all_month)
    end

  end

end
