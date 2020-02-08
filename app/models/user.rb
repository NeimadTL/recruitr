class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :firstname, presence: true, uniqueness: true
  validates :lastname, presence: true, uniqueness: true
  validates :city, presence: true, uniqueness: true
  validates :country, presence: true, uniqueness: true

  belongs_to :role

  has_many :user_skill_taggings
  has_many :skills, through: :user_skill_taggings

  has_many :user_position_requests
  has_many :applications, through: :user_position_requests, class_name: "Position",
                                                           foreign_key: "position_id",
                                                                source: :position

  has_many :interviewer_matchings, class_name: "IntervieweeInterviewerMatching",
                                  foreign_key: "interviewee_id"
  has_many :interviewers, through: :interviewer_matchings, class_name: "User",
                                                          foreign_key: "interviewee_id",
                                                               source: :interviewer

  has_many :interviewee_matchings, class_name: "IntervieweeInterviewerMatching",
                                  foreign_key: "interviewer_id"
  has_many :interviewees, through: :interviewee_matchings, class_name: "User",
                                                          foreign_key: "interviewer_id",
                                                               source: :interviewee



  # apply to a position
  def apply(position)
    applications << position
  end

  # withdraw application for a position
  def withdraw(position)
    applications.delete(position)
  end

  # checks whether an user has already applied to a position or not
  def applied?(position)
    applications.include?(position)
  end

end
