class Level < ActiveRecord::Base
  belongs_to :employee
  belongs_to :learning_indicator
  belongs_to :priority_rating

  def completion
    range = target_level - initial_level
    if range == 0 or not_relevant
      1
    else
      ([current_level, initial_level].max - initial_level).to_f/range
    end
  end

end
