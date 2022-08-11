class ApplicationController < ActionController::Base

  protected
    def after_sign_in_path_for(resource)
    if resource.role == 'admin'
      admin_dashboard_index_path
    else
      requestor_dashboard_index_path
    end
  end

  def authenticate_admin
    raise ActionController::RoutingError, 'Not Found' unless current_user.admin?
  end

  def authenticate_requestor
    raise ActionController::RoutingError, 'Not Found' unless current_user.requestor?
  end
  
  def set_jobs
    @jobs = current_user.jobs
  end
  
  def show_evaluation
    if @job.evaluation != nil
      convert_evaluation
    end
  end

  def convert_evaluation
      @response_time = convert_rating(@job.evaluation.response_time)           
      @quality = convert_rating(@job.evaluation.quality)           
      @courtesy = convert_rating(@job.evaluation.courtesy)
      @comments = @job.evaluation.comments   
  end

  def convert_rating(rating)
    case self
    when 1
        'Poor'
    when 2
        'Moderately Satisfactory'
    when 3
        'Satisfactory'
    when 4
        'Highly Satisfactory'
    else 5
        'Outstanding'
    end
  end

  def done_or_cancelled?
    @remark.status == 'Done' || @remark.status == 'Cancelled'
  end

end