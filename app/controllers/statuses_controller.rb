class StatusesController < ApplicationController

  def like
    @status = Status.find(params[:id])
      if @status.likes == nil
        @status.likes = 0
        @status.likes += 1
      else
        @status.likes += 1
      end
    @status.save
    redirect_to root_path
  end

  def index
    @statuses = Status.all

  end

  def new
    @status = Status.new
  end

  def create
    @status = Status.new(status_params)
      if @status.save
        redirect_to @status, notice: 'Status was successfully created!'
      else
        flash[:alert] = 'There were some errors on the page:'
        flash[:alert] << '<br>'
        flash[:alert] << @status.errors.full_messages.join('<br>')
        render :new
      end
  end

  def edit
    @status = Status.find(params[:id])
  end

  def update
    @status = Status.find(params[:id])
    if @status.update(status_params)
        redirect_to @status, notice: 'Status was successfully updated!'
    else
        flash[:alert] = 'There were some errors on the page:'
        flash[:alert] << '<br>'
        flash[:alert] << @status.errors.full_messages.join('<br>')
        render :edit
    end
  end

  def show
    @status = Status.find(params[:id])
  end

  def destroy
    @status = Status.find(params[:id])
    @status.destroy
    redirect_to root_path
  end

  private
  def status_params
    params.require(:status).permit(:user_name, :description)
  end
end
