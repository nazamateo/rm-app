class Admin::PdfController < ApplicationController

    def new
        @job = Job.all.find (params[:job_id])
        @requestor = User.all.find_by(id: @job.user_id)
    end

end
