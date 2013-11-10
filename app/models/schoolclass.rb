class Schoolclass < ActiveRecord::Base
    has_many :schoolclasstutors
    has_many :tutors, through: :schoolclasstutors
end
