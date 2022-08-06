class Requestor::EvaluationController < ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_requestor

    def new
        @current_user_jobs = current_user.jobs
        @job = @current_user_jobs.find params[:job_id]
        verify_status(@job.remark.last.status)
        @evaluation = @job.build_evaluation
    end

    def create
        @current_user_jobs = current_user.jobs
        @job = @current_user_jobs.find params[:job_id]
        @evaluation = @job.build_evaluation(evaluation_params)
        respond_to do |format|
            if  @evaluation.save
                format.html { redirect_to requestor_job_path(@job), notice: " Thank you for your feedback! We are glad to be of service." }
            else
                format.html { render :new, status: :unprocessable_entity }
            end
        end
    end

    private
    def evaluation_params
        params.require(:evaluation).permit(:response_time, :quality, :courtesy, :comments)
    end
    
    def verify_status(status)
        raise ActionController::RoutingError, 'Not Found' unless status ==='Done'
    end
end