class Position < ApplicationRecord

  validates :title, presence: true, uniqueness: true

end
