class User < ActiveRecord::Base
  has_many :companies

  ROLES = %w[sysop manager employee]

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :company, :name, :email, :password, :password_confirmation, :remember_me


def update_with_password(params={}) 
  if params[:password].blank? 
    params.delete(:password) 
    params.delete(:password_confirmation) if params[:password_confirmation].blank? 
  end 
  update_attributes(params) 
end 

 protected
  def is? r
    r.to_s == role
  end

end

# == Schema Information
#
# Table name: users
#
#  id                   :integer         not null, primary key
#  email                :string(255)     default(""), not null
#  encrypted_password   :string(128)     default(""), not null
#  password_salt        :string(255)     default(""), not null
#  reset_password_token :string(255)
#  remember_token       :string(255)
#  remember_created_at  :datetime
#  sign_in_count        :integer         default(0)
#  current_sign_in_at   :datetime
#  last_sign_in_at      :datetime
#  current_sign_in_ip   :string(255)
#  last_sign_in_ip      :string(255)
#  confirmation_token   :string(255)
#  confirmed_at         :datetime
#  confirmation_sent_at :datetime
#  failed_attempts      :integer         default(0)
#  unlock_token         :string(255)
#  locked_at            :datetime
#  authentication_token :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  role                 :string(255)     default("")
#

