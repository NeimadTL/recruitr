module InterviewerMatcher

  def interviewers_for(candidate, position)
    interviewers = []
    match_rate = 0
    candidate.skills.to_a.each do |skill|
      if position.skills.to_a.include?(skill)
        match_rate = match_rate + 1
      end
    end

    # if the candidate has at least half of the required skills then
    # we start to look for the best interviewers for this candidate
    if match_rate >= (position.skills.count / 2)
      employees = User.where(role_id: Role::EMPLOYEE_ROLE_CODE)
      employees.each do |employee|
        candidate.skills.to_a.each do |skill|
          if employee.skills.to_a.include?(skill)
            interviewers.push(employee)
          end
        end
      end
      # if there are no interviewers found then
      # we default with HR as interviewer(s)
      if interviewers.empty?
        interviewers = User.where(role_id: Role::HR_ROLE_CODE)
      end
    end

    # at that point, if there are still no interviewers then
    # it means the candidate is not a good match for the position
    # and should therefore be rejected
    interviewers.uniq
  end

end
