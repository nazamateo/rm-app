class Admin::JobsController < ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_admin
    
    def index
        @q = Job.ransack(params[:q])
        @jobs = @q.result.includes(:user, :remark, :evaluation, :assessor, :staff)
    end

    def show
        @job = Job.all.find params[:id]
        
        if @job.evaluation != nil
            @response_time = convert_rating(@job.evaluation.response_time)           
            @quality = convert_rating(@job.evaluation.quality)           
            @courtesy = convert_rating(@job.evaluation.courtesy)
            @comments = @job.evaluation.comments           
        end
    end

    def edit
        @job = Job.find params[:id]
    end

    def update
        @job = Job.find params[:id]
            if @job.update(job_update_params)
                redirect_to admin_job_path(@job), notice: "Job Order# #{@job.id} was successfully updated!"
            else
                render :edit, status: :unprocessable_entity
            end
    end

    private

    def job_update_params
        params.require(:job).permit(:assessor_id, :staff_id)
    end
end
