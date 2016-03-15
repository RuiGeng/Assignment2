class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :orders

  before_save { self.email = email.downcase }
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  validates :name, presence: true, on: [:create, :save, :update],
            length: { maximum: 50 }
  
  validates :email, :presence => true, 
            :length => {:minimum => 3, :maximum => 254},
            uniqueness: { case_sensitive: false }, :email => true, 
            :with  => Devise.email_regexp, on: [:create, :save, :update]
            
            
  validates :password, :presence => true, :confirmation => true,
            :within => Devise.password_length, on: [:create, :save, :update],
            :unless => :force_submit
            
end
