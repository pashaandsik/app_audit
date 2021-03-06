class DetailsController < ApplicationController
  # GET /details
  # GET /details.json
  def index
    @details = Detail.includes(:car,:warranty).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @details }
    end
  end
  def upgrade
    @details = Detail.includes(:car,:warranty).all
    @tile = Car.all
    #Detail.all.each do |detail|
    #  @dem= detail.id
    #  @dem=update_attributes( :job_id => detail.jobs.last.id)
    #end

    respond_to do |format|
      format.html # upgrade.html.erb

    end


  end


  # GET /details/1
  # GET /details/1.json
  def show
    @detail = Detail.includes(:car).find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @detail }
    end
  end

  # GET /details/new
  # GET /details/new.json
  def new
    @detail = Detail.new(:parent_id => params[:parent_id])
  end

  # GET /details/1/edit
  def edit
    @detail = Detail.find(params[:id])
  end

  # POST /details
  # POST /details.json
  def create
    @detail = Detail.new(params[:detail])

    respond_to do |format|
      if @detail.save
        format.html { redirect_to @detail, notice: 'Detail was successfully created.' }
        format.json { render json: @detail, status: :created, location: @detail }
      else
        format.html { render action: "new" }
        format.json { render json: @detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /details/1
  # PUT /details/1.json
  def update
    @detail = Detail.find(params[:id])

    respond_to do |format|
      if @detail.update_attributes(params[:detail])
        format.html { redirect_to @detail, notice: 'Detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /details/1
  # DELETE /details/1.json
  def destroy
    @detail = Detail.find(params[:id])
    @detail.destroy

    respond_to do |format|
      format.html { redirect_to details_url }
      format.json { head :no_content }
    end
  end
end
