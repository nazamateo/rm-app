class Admin::JobsController < ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_admin
    
    def index
        @jobs = Job.all.sort
    end

    def show
    end

    def edit
        @job = Job.find params[:id]
    end

    def update
        @job = Job.find params[:id]
        respond_to do |format|
            if @job.update(job_update_params)
                format.html { redirect_to admin_jobs_path, notice: "Job Order# #{@job.id} was successfully updated!." }
            else
                format.html { render :index, status: :unprocessable_entity }
            end
        end
    end

    private

    def job_update_params
        params.require(:job).permit(:assessor_id, :staff_id)
    end
end