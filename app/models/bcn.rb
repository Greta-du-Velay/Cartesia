class Bcn < ActiveRecord::Base
  belongs_to :company
  has_many :learning_indicators, :dependent => :destroy

#  has_many :company_bcns, :dependent => :destroy
#  has_many :companies, :through => :company_bcns
  attr_accessible :name, :label, :description

  accepts_nested_attributes_for :learning_indicators

  validates :name, :presence => true
  validates :description, :presence => true


  def completion
    total_bcn = 0.0
    n_bcn = 0
    company.employees.each do |e|
      e_bcn = e.bcn_completion id
      if !e_bcn.nil?
        total_bcn += e_bcn
        n_bcn += 1
      end
    end
    
    if n_bcn == 0
      nil
    else
      total_bcn / n_bcn
    end
  end

end
