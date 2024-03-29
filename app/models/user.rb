class User < ActiveRecord::Base
  include ActiveSupport
  
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?
  
  enum time_zone: TimeZone.us_zones.map{|k|k.to_s}

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
