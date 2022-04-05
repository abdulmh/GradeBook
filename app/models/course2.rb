class Course2 < ApplicationRecord
	# validates method specifies that an course is valid only if
	# a first name and last name are present
	validates :course_name, presence: true
end
