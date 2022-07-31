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
end