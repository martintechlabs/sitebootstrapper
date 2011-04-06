class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :remember_me, :is_admin, :lat, :lng, :photo, :phone
  
  validates :email, :presence => true, :uniqueness => true, :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
  validates :password, :presence => true, :confirmation => true, :length => { :within => 6..20 }, :if => Proc.new { |user| user.password.present? }
  validates :first_name, :presence => true, :length => { :minimum => 2, :maximum => 100 }
  validates :last_name, :presence => true, :length => { :minimum => 2, :maximum => 100 }
  
  has_attached_file :photo, {
      :url => "/system/:class/:attachment/:id/:style_:basename.:extension",
      :path => ":rails_root/public/system/:class/:attachment/:id/:style_:basename.:extension",
      :styles => {
        :thumbnail => "60x60>",
        :original => "250x250>"
      },
      :default_url => "/images/default_user.png"
  }

  def is_admin?
    is_admin
  end
  
  def status
    active? ? 'active' : 'pending'
  end

  def full_name
    return "#{first_name} #{last_name}" if !first_name.blank? and !last_name.blank?
    return first_name if !first_name.blank?
    return last_name if !last_name.blank?
    return email if email
    return ''
  end

end
