class MileageAllsController < ApplicationController
  # GET /mileage_alls
  # GET /mileage_alls.json
  def index
    @mileage_alls = MileageAll.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mileage_alls }
    end
  end

  # GET /mileage_alls/1
  # GET /mileage_alls/1.json
  def show
    @mileage_all = MileageAll.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mileage_all }
    end
  end

  # GET /mileage_alls/new
  # GET /mileage_alls/new.json
  def new
    @mileage_all = MileageAll.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mileage_all }
    end
  end

  # GET /mileage_alls/1/edit
  def edit
    @mileage_all = MileageAll.find(params[:id])
  end

  # POST /mileage_alls
  # POST /mileage_alls.json
  def create
    @mileage_all = MileageAll.new(params[:mileage_all])

    respond_to do |format|
      if @mileage_all.save
        format.html { redirect_to @mileage_all, notice: 'Mileage all was successfully created.' }
        format.json { render json: @mileage_all, status: :created, location: @mileage_all }
      else
        format.html { render action: "new" }
        format.json { render json: @mileage_all.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mileage_alls/1
  # PUT /mileage_alls/1.json
  def update
    @mileage_all = MileageAll.find(params[:id])

    respond_to do |format|
      if @mileage_all.update_attributes(params[:mileage_all])
        format.html { redirect_to @mileage_all, notice: 'Mileage all was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mileage_all.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mileage_alls/1
  # DELETE /mileage_alls/1.json
  def destroy
    @mileage_all = MileageAll.find(params[:id])
    @mileage_all.destroy

    respond_to do |format|
      format.html { redirect_to mileage_alls_url }
      format.json { head :no_content }
    end
  end
end
