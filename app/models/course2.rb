class Course2 < ApplicationRecord
	# has_many method specifies a one to many relationship
	# rosters option specifies that one student has many appearances
	has_many :rosters
	# students option specifies that one course has many students
	# the through option specifies that the relationship exists
	# only through coursestudent2s 
	has_many :students, through: :rosters
	# validates method specifies that an course is valid only if
	# a course is present
	validates :course_name, presence: true
end