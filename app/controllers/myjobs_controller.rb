class MyjobsController < ApplicationController

def index
  if current_user.present?
    @myjobs = current_user.myjobs
  else
    @myjobs = Myjob.all.order("created_at DESC")
  end
end

def show

end

def new
  @myjob = Myjob.new(job_id: params[:job_id])
  @myjob.user = current_user
  @myjob.save
  redirect_to :root, notice: "This job's been added. Congrats!"
end

def create
    @myjob = Myjob.new(myjob_params)
    @myjob.user = current_user

    respond_to do |format|
      if @myjob.save
        format.html { redirect_to @myjob, notice: 'Your Job was successfully created.' }
        else
        format.html { render :new }
      end
    end
  # @myjob = current_user.myjobs.build(myjob_params)
  # if @myjob.save
  #   redirect_to root_path, notice: "Nice Job!"
  # else
  #   render 'new'
  # end
end

def edit

end

def update

end

def destroy
  @myjob = Myjob.find(params[:id])
  @myjob.destroy
  redirect_to :back
end



private

def find_myjob
  @myjob = Myjob.find(params[:id])
end

def myjob_params
  params.require(:myjob).permit(:job_id)
end

end
