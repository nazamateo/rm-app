class Admin::RemarksController < ApplicationController
    
    def new
        @job = Job.all.find params[:job_id]
    end

    def create
        @job = Job.all.find params[:job_id]
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
 
end