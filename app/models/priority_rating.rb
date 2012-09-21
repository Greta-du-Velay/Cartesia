class PriorityRating < ActiveRecord::Base
  has_one :bcn
  has_many :levels
end
