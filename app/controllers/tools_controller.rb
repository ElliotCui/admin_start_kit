class ToolsController < ApplicationController
  def datetimepicker
    @start_time = params[:start_time].present? ? Time.parse(params[:start_time]) : Time.now.beginning_of_day
    @end_time = params[:end_time].present? ? Time.parse(params[:end_time]) : Time.now.end_of_day

    @start_date = params[:start_date].present? ? Time.parse(params[:start_date]) : Date.today
    @end_date = params[:end_date].present? ? Time.parse(params[:end_date]) : Date.today
  end
end
