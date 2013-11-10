class Tutor < ActiveRecord::Base
    belongs_to :user
    has_many :schoolclasstutors
    has_many :schoolclasses, through: :schoolclasstutors
end
