module InterviewerMatcher

  def interviewers_for(candidate)
    interviewers = []
    employees = User.where(role_id: Role::EMPLOYEE_ROLE_CODE)
    employees.each do |employee|
      candidate.skills.to_a.each do |skill|
        if employee.skills.to_a.include?(skill)
          interviewers.push(employee)
        end
      end
    end
    interviewers.uniq
  end

end
