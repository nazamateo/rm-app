class Requestor::JobsController < ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_requestor

    def show
    end

    def new
        @job = current_user.jobs.build
    end

    def create
    end

    def edit
    end

    def update
    end

end
