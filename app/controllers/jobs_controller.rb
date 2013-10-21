class JobsController < ApplicationController
  # GET /jobs
  # GET /jobs.json
  def reportsjob
    if params[:data_min] and params[:data_max]
      #@jobs = Job.select("*").where("date(jobs.created_at)>= ? AND date(jobs.created_at)<=?", params[:data_min], params[:data_max]).(select("cars.name as name, Sum(jobs.km_n) as km_all , Sum(jobs.m_ch) as m_ch_all").joins(:jobs).group("cars.name"))
      @jobs = Car.select("cars.name as name, Sum(jobs.km_n) as km_all , Sum(jobs.m_ch) as m_ch_all").joins(:jobs).where("date(jobs.created_at)>= ? AND date(jobs.created_at)<=?", params[:data_min], params[:data_max]).group("cars.name")
    else
      @jobs = Car.select("cars.name as name, Sum(jobs.km_n) as km_all , Sum(jobs.m_ch) as m_ch_all").joins(:jobs).group("cars.name")
        #Job.select("car.name,date(created_at) as ordered_date, sum(km_n) as kilometr_all, sum(m_ch) as time_all").joins(:car).group("date(created_at) ")
      #@jobq = Job.where("date(jobs.created_at)>= ? AND date(jobs.created_at)<=?", params[:data_min], params[:data_max]).(Car.select("cars.name as name, Sum(jobs.km_n) as km_all , Sum(jobs.m_ch) as m_ch_all").joins(:jobs).group("cars.name"))
        #Car.select("cars.name, Sum(jobs.km_n) , Sum(jobs.m_ch)").joins(:jobs).where("date(jobs.created_at)<= ? AND date(jobs.created_at)>=?", "2013-10-30" ,"2013-10-01").group("cars.name")
    end
  end
  def reportsto


    if params[:data_min] and params[:data_max]   #Job.where(:to => true 'OR' :repair => true)
      @jobs_to = Car.select("cars.name,repairs.cause as causee, jobs.repair_job , details.name_det as name_detall, date(repairs.created_at) as date_repairs").where("date(jobs.created_at)>= ? AND date(jobs.created_at)<=?", params[:data_min], params[:data_max]).where( 'jobs.repair_job' => true ).joins(" INNER JOIN repairs ON repairs.car_id = cars.id INNER JOIN jobs ON repairs.job_id = jobs.id INNER JOIN details ON details.id = repairs.detail_id")
      @jobs_rep = Job.where("date(jobs.created_at)>= ? AND date(jobs.created_at)<=?", params[:data_min], params[:data_max]).where(to: true )
      #Car.select("cars.name,repairs.cause, jobs.repair, details.name_det, repairs.created_at").where("date(jobs.created_at)>= ? AND date(jobs.created_at)<=?", params[:data_min], params[:data_max]).where( 'jobs.to' => true ).joins(" INNER JOIN repairs ON repairs.car_id = cars.id INNER JOIN jobs ON repairs.job_id = jobs.id INNER JOIN details ON details.id = repairs.detail_id")
      #Repair.select("cars.name,repairs.cause, jobs.repair, details.name_det, repairs.created_at").where("date(jobs.created_at)>= ? AND date(jobs.created_at)<=?", "2013-10-10", "2013-10-11").where(to: true ).joins(:car,  :detail, :jobs )
      #Job.all.find_by_sql("
      #SELECT cars.name,
      #  repairs.cause,
      #  jobs.repair,
      #  details.name_det,
      #  repairs.created_at
      #FROM cars
      #INNER JOIN repairs ON repairs.car_id = cars.id
      #INNER JOIN jobs ON repairs.job_id = jobs.id
      #INNER JOIN details ON details.id = repairs.detail_id
      #WHERE jobs.repair = 't'
      #")


    else
      @jobs_to = Car.select("cars.name,repairs.cause as causee, repair_job , details.name_det as name_detall, date(repairs.created_at) as date_repairs").where( 'jobs.repair_job' => true ).joins(" INNER JOIN repairs ON repairs.car_id = cars.id INNER JOIN jobs ON repairs.job_id = jobs.id INNER JOIN details ON details.id = repairs.detail_id")
      @jobs_rep = Job.where(to: true )
    end

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
