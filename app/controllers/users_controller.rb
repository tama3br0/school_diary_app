class UsersController < ApplicationController
    before_action :authenticate_user!

    def additional_info
      @user = current_user
    end

    def save_additional_info
      @user = current_user
      @user.skip_validations = false

      grade_class = GradeClass.find_or_create_by(
        grade: params[:user][:grade].to_i,
        class_num: params[:user][:class_num].to_i,
        school_code: params[:user][:school_code].to_i
      )

      @user.grade_class = grade_class
      @user.assign_attributes(user_params.except(:grade, :class_num, :school_code))
      @user.additional_info_provided = true

      if @user.save
        redirect_to authenticated_root_path, notice: 'あたらしく とうろくが できました！'
      else
        render :additional_info
      end
    end

    private

    def user_params
        params.require(:user).permit(:role, :name, :student_num, :grade, :class_num, :school_code)
    end
end
