class Admin::RemarksController < ApplicationController
    
    def new
        @job = Job.all.find params[:job_id]
    end

    def create
        @job = Job.all.find params[:job_id]
        @remark = @job.remark.build(remarks_params)
            if  @remark.save
                redirect_to admin_job_path(@job),  notice: "Job Order# #{@job.id} was successfully updated!." 
            else
                render :new, status: :unprocessable_entity
            end
    end

    private
    def remarks_params
        params.require(:remark).permit(:status, :remarks)
    end
 
end
