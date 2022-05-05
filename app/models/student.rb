class Student < ApplicationRecord
	# has_many method specifies a one to many relationship
	# rosters option specifies that one student has many appearances
	has_many :rosters
	# course2s option specifies that one student has many course2s
	# the through option specifies that the relationship exists
	# only through coursestudent2s 
	has_many :course2s, through: :rosters
	# validates method specifies that an actor is valid only if
	# a full name and email are present
	validates :fullname, :email, presence: true
end