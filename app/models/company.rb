class Company < ActiveRecord::Base
  has_many :employees, :dependent => :destroy
  has_many :bcns, :dependent => :destroy
  belongs_to :user

  attr_accessible :name, :manager, :description, :workers_count, :bcns_attributes, :fake

  validates :name, :presence => true
  validates :manager, :presence => true
  validates :description, :presence => true
  validates :workers_count, :numericality => true
  
  accepts_nested_attributes_for :bcns

  before_save :set_permalink

  def completion
    total = 0.0
    n_bcn = 0
    bcns.each do |bcn|
      b = bcn.completion
      if !b.nil?
        total += b
        n_bcn += 1
      end
    end
    
    if n_bcn == 0
      nil
    else
      total / n_bcn
    end
  end


  protected

  def set_permalink
    chars = 'bcdfghjkmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ23456789'.split(//)
    base = chars.size
    begin
      i = 9999999999 + rand(999999)*rand(999999999)*rand(999999)
      buf = ''
      while i != 0
        r = i % base
        i = (i - r) / base
        buf += chars[r]
      end
      p = buf.split(//).shuffle.join
    end until Company.find_by_permalink(p).nil?

    self.permalink = p
  end  

end
