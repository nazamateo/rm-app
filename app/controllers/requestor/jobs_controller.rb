class Requestor::JobsController < ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_requestor
    before_action :set_jobs, only: %i[ index show new create ]

    def index
    end

    def show
        @job = @jobs.find params[:id] 
        show_evaluation
    end

    def new
        @job = @jobs.build
    end

    def create
        @job = @jobs.build(jobs_params)
            if  @job.save
                UserMailer.with(user: current_user).job_created_email_noti.deliver_later
                redirect_to requestor_job_path(@job), notice: "Job Order was successfully created."
            else
                render :new, status: :unprocessable_entity 
            end
    end

    private

    def jobs_params
        params.require(:job).permit(:nature_of_request, :note_to_staff)
    end

end