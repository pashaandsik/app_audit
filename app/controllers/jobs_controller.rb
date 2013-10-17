class JobsController < ApplicationController
  # GET /jobs
  # GET /jobs.json
  def reportsjob
    if params[:data_min] and params[:data_max]
    @jobs = Car.select("cars.name as name, Sum(jobs.km_n) as km_all , Sum(jobs.m_ch) as m_ch_all").joins(:jobs).where("date(jobs.created_at)>= ? AND date(jobs.created_at)<=?", params[:data_min], params[:data_max]).group("cars.name")
    else
      @jobs = Car.select("cars.name as name, Sum(jobs.km_n) as km_all , Sum(jobs.m_ch) as m_ch_all").joins(:jobs).group("cars.name")
        #Job.select("car.name,date(created_at) as ordered_date, sum(km_n) as kilometr_all, sum(m_ch) as time_all").joins(:car).group("date(created_at) ")
        #Car.select("cars.name, Sum(jobs.km_n) , Sum(jobs.m_ch)").joins(:jobs).where("date(jobs.created_at)<= ? AND date(jobs.created_at)>=?", "2013-10-30" ,"2013-10-01").group("cars.name")
    end
  end
  def reportsto

  end
  def index
    @jobs = Job.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @jobs }
    end
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    @job =Job.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @job }
    end
  end

  # GET /jobs/new
  # GET /jobs/new.json
  def new
    @job = Job.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @job }
    end
  end

  # GET /jobs/1/edit
  def edit
    @job = Job.find(params[:id])
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(params[:job])


    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render json: @job, status: :created, location: @job }

      else
        format.html { render action: "new" }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /jobs/1
  # PUT /jobs/1.json
  def update
    @job = Job.find(params[:id])

    respond_to do |format|
      if @job.update_attributes(params[:job])
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    respond_to do |format|
      format.html { redirect_to jobs_url }
      format.json { head :no_content }
    end
  end
end
