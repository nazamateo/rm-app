class Admin::JobsController < ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_admin
    before_action :set_job, only: %i[ show edit update ]
    
    def index
        @q = Job.ransack(params[:q])
        @jobs = @q.result.includes(:user, :remark, :evaluation, :assessor, :staff)
    end

    def show        
        show_evaluation
    end

    def edit
    end

    def update
        if @job.update(job_update_params)
            UserMailer.with(job: @job).job_update_email_noti.deliver_later
            redirect_to admin_job_path(@job), notice: "Job Order# #{@job.id} was successfully updated!"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    private

    def job_update_params
        params.require(:job).permit(:assessor_id, :staff_id)
    end

    def set_job
        @job = Job.all.find (params[:id])
    end
end