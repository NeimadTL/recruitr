class ApplicationController < ActionController::Base

  # redirect to right the url according to user role
  def after_sign_in_path_for(resource_or_scope)
    if current_user.role.code == Role::HR_ROLE_CODE
      hr_positions_url
    elsif current_user.role.code == Role::CANDIDATE_ROLE_CODE
      admin_transactions_url
    end
  end

end
