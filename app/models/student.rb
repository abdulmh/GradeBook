class Student < ApplicationRecord
	
	validates :fullname, :email, presence: true
end
