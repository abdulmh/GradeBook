class Assignment2 < ApplicationRecord
	validates :assignmentname, :totalpoints,  presence: true
end
