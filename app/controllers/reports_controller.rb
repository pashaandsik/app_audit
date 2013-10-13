class ReportsController < ApplicationController
  # GET /reports
  # GET /reports.json
  def index
    @jobs=Job.all

  end

  # GET /reports/1
  # GET /reports/1.json
  def show
    @car = Job.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @report }
    end
  end


end
