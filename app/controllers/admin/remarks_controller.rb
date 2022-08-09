class Admin::RemarksController < ApplicationController
    
    def create
        @job = Job.all.find params[:job_id]
        @remark = @job.remark.build(remarks_params)
        respond_to do |format|
            if  @remark.save
                format.html { redirect_to admin_jobs_path,  notice: "Job Order# #{@job.id} was successfully updated!." }
            end
        end
    end

    private
    def remarks_params
        params.require(:remark).permit(:status, :remarks)
    end
 
end
