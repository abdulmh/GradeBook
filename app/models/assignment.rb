class Assignment < ApplicationRecord
	validates :assignmentname, :totalpoints, presence: true
end
