class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :orders
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  validates_presence_of :name, on: [:create, :save, :update]
  validates_length_of :name, maximum: 50
  
  validates_presence_of :email, on: [:create, :save, :update]
  validates_format_of    :email,    :with  => Devise.email_regexp, :if => :email_changed?
  validates_uniqueness_of :email, :case_sensitive => false, :if => :email_changed?

  validates_presence_of :password, on: [:create, :save, :update]
  validates_confirmation_of :password, on: [:create, :save, :update]
  validates_length_of :password, :within => Devise.password_length
end
