class Admin::JobsController < ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_admin
    
    def index
        @jobs = Job.all
    end

    def show
    end

    def edit
    end

    def update
    end
    
end