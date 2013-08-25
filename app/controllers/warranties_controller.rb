class WarrantiesController < ApplicationController
  # GET /warranties
  # GET /warranties.json
  def index
    @warranties = Warranty.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @warranties }
    end
  end

  # GET /warranties/1
  # GET /warranties/1.json
  def show
    @warranty = Warranty.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @warranty }
    end
  end

  # GET /warranties/new
  # GET /warranties/new.json
  def new
    @warranty = Warranty.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @warranty }
    end
  end

  # GET /warranties/1/edit
  def edit
    @warranty = Warranty.find(params[:id])
  end

  # POST /warranties
  # POST /warranties.json
  def create
    @warranty = Warranty.new(params[:warranty])

    respond_to do |format|
      if @warranty.save
        format.html { redirect_to @warranty, notice: 'Warranty was successfully created.' }
        format.json { render json: @warranty, status: :created, location: @warranty }
      else
        format.html { render action: "new" }
        format.json { render json: @warranty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /warranties/1
  # PUT /warranties/1.json
  def update
    @warranty = Warranty.find(params[:id])

    respond_to do |format|
      if @warranty.update_attributes(params[:warranty])
        format.html { redirect_to @warranty, notice: 'Warranty was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @warranty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /warranties/1
  # DELETE /warranties/1.json
  def destroy
    @warranty = Warranty.find(params[:id])
    @warranty.destroy

    respond_to do |format|
      format.html { redirect_to warranties_url }
      format.json { head :no_content }
    end
  end
end
