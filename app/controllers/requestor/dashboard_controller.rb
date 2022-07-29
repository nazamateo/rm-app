class Requestor::DashboardController < ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_requestor

    def index
    end

end