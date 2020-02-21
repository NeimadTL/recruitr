class HrFilter

  def self.before(controller)
    unless controller.current_user.role.code == Role::HR_ROLE_CODE
      controller.flash[:alert] = 'The page you were looking for requires HR access rights'
      controller.redirect_to controller.root_path
    end
  end

end
