class HomeController < ApplicationController
    before_action :authenticate_user!

    def index
      @user = current_user
      if @user.grade_class.present?
        @school_code = @user.grade_class.school_code
        @grade = @user.grade_class.grade
        @class_num = @user.grade_class.class_num
        @student_num = @user.student_num
        @role = @user.role
        @name = @user.name
      end
    end
end
