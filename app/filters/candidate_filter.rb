class CandidateFilter

  def self.before(controller)
    unless controller.current_user.role.code == Role::CANDIDATE_ROLE_CODE
      controller.flash[:alert] = 'The page you were looking for requires candidate access rights'
      controller.redirect_to controller.root_path
    end
  end

end
