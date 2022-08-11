class Admin::RemarksController < ApplicationController

    before_action :authenticate_user!
    before_action :authenticate_admin
    before_action :set_job, only: %i[ new create ]
    
    def new
    end

    def create
        @remark = @job.remark.build(remarks_params)
            if  @remark.save
                if @remark.status == 'Done' || @remark.status == 'Cancelled'
                    UserMailer.with(job: @job, remark: @remark).job_closed_email_noti.deliver_later
                    redirect_to admin_job_path(@job),  notice: "Job Order# #{@job.id} was successfully updated!." 
                else
                    redirect_to admin_job_path(@job),  notice: "Job Order# #{@job.id} was successfully updated!." 
                end
            else
                render :new, status: :unprocessable_entity
            end
    end

    private
    def remarks_params
        params.require(:remark).permit(:status, :remarks)
    end
    
    def set_job
        @job = Job.all.find params[:job_id]
    end
  
end