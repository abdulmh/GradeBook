class Appearance < ApplicationRecord
  # belongs_to method specifies a one to one relationship
  # course options specifies that one appearance has one course
  belongs_to :course
  # assignment option specifies that one appearance has one assignment
  belongs_to :assignment
  # validates method specifies that an appearance is valid only if 
  # an course id and assignment id are present
  validates :course_id, :assignment_id, presence: true
end