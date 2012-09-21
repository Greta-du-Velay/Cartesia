class Employee < User
  has_many :levels, :dependent => :destroy
  belongs_to :company

  validates :name, :presence => true

  after_create do |e|
    e.company.bcns.each do |bcn|
      bcn.learning_indicators.each do |li|
        level = li.levels.build(:employee => e, :initial_level => 1, :target_level => 10, :current_level => 1)
        level.save
        logger.debug level.inspect
      end
    end
  end


  def email_required?
    false
  end

  def validate_uniqueness_of_email?
    false
  end

=begin
  def normalize_levels
    bcns = company.bcns

    # create levels for all bcns/learning indicators
    bcns.each do |bcn|
      bcn.learning_indicators.each do |li|
        if levels.where(:learning_indicator_id => li.id).empty?
          #logger.debug "empty #{li.name}"
          levels.create(:learning_indicator => li, :initial_level => 1, :current_level => 1, :target_level => 10, :priority_rating_id => 1).save
        else
          level = levels.where(:learning_indicator_id => li.id).first
          level.current_level = [level.initial_level, level.current_level].max
          level.current_level = [level.target_level, level.current_level].min
          level.save
        end
      end
    end
  end
=end


  def completion
    total = 0.0
    n_bcn = 0
    company.bcns.each do |bcn|
      c_comp = bcn_completion bcn.id
      if !c_comp.nil?
        total += c_comp
        n_bcn += 1
      end
    end
    
    if n_bcn == 0
      nil
    else
      total / n_bcn
    end
  end

  def bcn_completion bcn_id
    bcn = company.bcns.find(bcn_id)
    total_bcn = 0.0
    n_li = 0
    bcn.learning_indicators.each do |li|
      level = levels.where(:learning_indicator_id => li.id).first
      if !level.not_relevant
        n_li += 1
        range = level.target_level - level.initial_level
        if range == 0
          total_bcn += 1
        else
          total_bcn += (level.current_level - level.initial_level).to_f/range
        end
      end
    end
    
    if n_li == 0
      nil
    else
      total_bcn / n_li
    end
  end

end

