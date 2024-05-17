class StampsController < ApplicationController
    before_action :authenticate_user!

    def show
        @user = User.find(params[:id])
        @diaries = @user.diaries.includes(:stamps)
    end
end
