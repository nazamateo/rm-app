class Admin::PdfController < ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_admin
    
    def new
        @job = Job.all.find (params[:job_id])
        @requestor = User.all.find_by(id: @job.user_id)
    end

end
