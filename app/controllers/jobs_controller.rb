class JobsController < ApplicationController
    before_action :find_job, only: [:show, :edit, :update, :destroy]
    # before_action :authenticate_user!

    def index
      @jobs = Job.all.order("created_at DESC")
    end

    def show

    end

    def new
      @job = current_user.jobs.build
    end

    def create
      @job = current_user.jobs.build(job_params)
      @job.added = false
      if @job.save
        redirect_to root_path
      else
        render 'new'
      end
    end

    def edit

    end

    def update
      if @job.update(job_params)
        redirect_to job_path(@job)
      else
        render 'edit'
      end
    end

    def destroy
      @job.destroy
      redirect_to root_path
    end

    def addjob
      @job = Job.find(params[:id])
      if @job.present?
        @job.user = current_user
        @job.added = true
        current_user.save
        @job.save
        notice_message = "Congratulations! You've just added this job to your profile."
      end
    end

    private

    def job_params
      params.require(:job).permit(:title, :description, :value, :time, :verified, :employed, :added)
    end

    def find_job
      @job = Job.find(params[:id])
    end
end
