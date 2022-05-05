class Roster < ApplicationRecord
  #belongs_to method specifies a one to one relationship
  #actor option specifies that one roster has one course
  belongs_to :course2
  # student option specifies that one roster has one student
  belongs_to :student
  # validates method specifies that an appearance is valid only if 
  # an actor id and movie id are present
  validates :course2_id, :student_id, presence: true
end
