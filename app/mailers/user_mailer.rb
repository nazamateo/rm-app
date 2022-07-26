class UserMailer < ApplicationMailer

    def job_created_email_noti
        @user = params[:user]
        @job = @user.jobs.last
        @url  = "https://dlshsi-engg-jo-app.herokuapp.com/requestor/jobs/#{@job.id}"
        mail(to: @user.email, subject: "Job order number #{@job.id} created successfully!")
    end
    
    def job_update_email_noti
        @job = params[:job]
        @user = User.all.find_by(id: @job.user_id)
        @url  = "https://dlshsi-engg-jo-app.herokuapp.com/requestor/jobs/#{@job.id}"
        mail(to: @user.email, subject: "Job order number #{@job.id} assigned personnel.")
    end
    
    def job_closed_email_noti
        @job = params[:job]
        @user = User.all.find_by(id: @job.user_id)
        @url  = "https://dlshsi-engg-jo-app.herokuapp.com/requestor/jobs/#{@job.id}/evaluation/new"
        mail(to: @user.email, subject: "Job order number #{@job.id} closed.")
    end

end
