class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :update, :create, :edit, :destroy]
  def show
    @job = Job.find(params[:id])
    if @job.is_hidden
      flash[:alert]= "This job is already achieved"
      redirect_to root_path
    end
  end

  

  def index
    @jobs = case params[:order]
            when 'by_lower_bound'
              Job.published.order('wage_lower_bound DESC')
            when 'by_upper_bound'
              Job.published.order('wage_upper_bound DESC')
            else
              Job.published.recent
            end
  end


  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_parames)
    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_parames)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to root_path
  end

private
  def job_parames
    params.require(:job).permit(:title, :descripiton, :wage_upper_bound, :wage_lower_bound, :contact_email, :is_hidden)
  end

end
