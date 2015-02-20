class StatusesController < ApplicationController

  def index
    @statuses = Status.all
  end

  def new
    @status = Status.new
  end


  def create
    @status = Status.new(status_params)

      if @status.save
        redirect_to @status, notice: 'Status was successfully updated!'
      else
        render :new
      end

  end

  def show
    @status = Status.find(params[:id])
  end

  private
  def status_params
    params.require(:status).permit(:username, :description)
  end
end
