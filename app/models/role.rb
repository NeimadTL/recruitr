class Role < ApplicationRecord

  self.primary_key = 'code'

  HR_ROLE_CODE = 1
  EMPLOYEE_ROLE_CODE = 2
  CANDIDATE_ROLE_CODE = 3

  has_one :user

end
