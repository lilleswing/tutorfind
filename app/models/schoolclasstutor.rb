class Schoolclasstutor < ActiveRecord::Base
  belongs_to :schoolclass
  belongs_to :tutor
end
