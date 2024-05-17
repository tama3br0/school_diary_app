class ApplicationController < ActionController::Base
    before_action :authenticate_user!, unless: :devise_controller?
    before_action :check_user_authentication

    private

    def check_user_authentication
      if user_signed_in?
        if current_user.grade_class_id.nil? && !skip_authentication_check_for_current_path?
          redirect_to additional_info_path
        end
      else
        if request.path == authenticated_root_path
          redirect_to unauthenticated_root_path unless request.path == unauthenticated_root_path
        end
      end
    end

    def skip_authentication_check_for_current_path?
      request.path == additional_info_path ||
      request.path == destroy_user_session_path ||
      request.path == save_additional_info_path
    end

    def after_sign_out_path_for(_resource_or_scope)
      unauthenticated_root_path
    end
end
