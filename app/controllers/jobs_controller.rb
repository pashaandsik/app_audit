class JobsController < ApplicationController
  # GET /jobs
  # GET /jobs.json
  def reportsjob
    if params[:data_min] and params[:data_max]
      @jobs = Car.select("cars.name as name, Sum(jobs.km_n) as km_all , Sum(jobs.m_ch) as m_ch_all").joins(:jobs).where("date(jobs.created_at)>= ? AND date(jobs.created_at)<=?", params[:data_min], params[:data_max]).group("cars.name")
    else
      @jobs = Car.select("cars.name as name, Sum(jobs.km_n) as km_all , Sum(jobs.m_ch) as m_ch_all").joins(:jobs).group("cars.name")
     end
  end
  def reportsto


    if params[:data_min] and params[:data_max]
      @jobs_to = Car.select("cars.name,repairs.cause as causee, jobs.repair_job , details.name_det as name_detall, date(repairs.created_at) as date_repairs").where("date(jobs.created_at)>= ? AND date(jobs.created_at)<=?", params[:data_min], params[:data_max]).where( 'jobs.repair_job' => true ).joins(" INNER JOIN repairs ON repairs.car_id = cars.id INNER JOIN jobs ON repairs.job_id = jobs.id INNER JOIN details ON details.id = repairs.detail_id")
      @jobs_rep = Job.includes(:car).where("date(jobs.created_at)>= ? AND date(jobs.created_at)<=?", params[:data_min], params[:data_max]).where("'jobs'.'to' = 't' or 'jobs'.'season_bool'= 't'")

    else
      @jobs_to = Car.select("cars.name,repairs.cause as causee, repair_job , details.name_det as name_detall, date(repairs.created_at) as date_repairs").where( 'jobs.repair_job' => true ).joins(" INNER JOIN repairs ON repairs.car_id = cars.id INNER JOIN jobs ON repairs.job_id = jobs.id INNER JOIN details ON details.id = repairs.detail_id")
      @jobs_rep = Job.includes(:car).where("'jobs'.'to' = 't' or 'jobs'.'season_bool'= 't'")
    end

  end
  def index
    @jobs = Job.includes(:car).all

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
