class MassagesController < ApplicationController
  # GET /massages
  # GET /massages.json
  def index
    @massages = Massage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @massages }
    end
  end

  # GET /massages/1
  # GET /massages/1.json
  def show
    @massage = Massage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @massage }
    end
  end

  # GET /massages/new
  # GET /massages/new.json
  def new
    @massage = Massage.new
    @massage.parent_id = params[:massage][:parent_id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @massage }
    end
  end

  # GET /massages/1/edit
  def edit
    @massage = Massage.find(params[:id])
  end

  # POST /massages
  # POST /massages.json
  def create
    @massage = Massage.new(params[:massage])

    respond_to do |format|
      if @massage.save
        format.html { redirect_to @massage, notice: 'Massage was successfully created.' }
        format.json { render json: @massage, status: :created, location: @massage }
      else
        format.html { render action: "new" }
        format.json { render json: @massage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /massages/1
  # PUT /massages/1.json
  def update
    @massage = Massage.find(params[:id])

    respond_to do |format|
      if @massage.update_attributes(params[:massage])
        format.html { redirect_to @massage, notice: 'Massage was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @massage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /massages/1
  # DELETE /massages/1.json
  def destroy
    @massage = Massage.find(params[:id])
    @massage.destroy

    respond_to do |format|
      format.html { redirect_to massages_url }
      format.json { head :no_content }
    end
  end
end
