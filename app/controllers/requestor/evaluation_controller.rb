class Requestor::EvaluationController < ApplicationController

    def new
        @current_user_jobs = current_user.jobs
        @job = @current_user_jobs.find params[:job_id]
        @evaluation = @job.build_evaluation
    end


end
