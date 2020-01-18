class Role < ApplicationRecord

  self.primary_key = 'code'
  has_one :user
  
end
