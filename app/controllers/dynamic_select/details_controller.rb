module DynamicSelect
  class StatesController < ApplicationController
    respond_to :json

    def index
      @details  = State.where(:car_id => params[:car_id])
      respond_with(@details)
    end
  end
end
