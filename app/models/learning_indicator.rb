class LearningIndicator < ActiveRecord::Base
  belongs_to :bcn
  has_many :levels, :dependent => :destroy

  attr_accessible :name, :label

  validates :name, :presence => true, :uniqueness => true

  after_create do |li|
    li.bcn.company.employees.each do |e|
      level = li.levels.build(:employee => e, :initial_level => 1, :target_level => 10, :current_level => 1)
      level.save
      #logger.debug level.inspect
    end
  end

end
