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

end