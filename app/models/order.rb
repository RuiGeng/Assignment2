class Order < ActiveRecord::Base
  belongs_to :user
  
  before_save { self.email = email.downcase }
  
  VALID_PHONE_REGEX = /\d{3}-\d{3}-\d{4}/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_POSTALCODE_REGEX = /\A[ABCEGHJKLMNPRSTVXY]{1}\\d{1}[A-Z]{1}[ -]?\\d{1}[A-Z]{1}\\d{1}\z/
  
  validates :user_id, presence: true
  
  validates :orderDate, presence: true
  
  validates :firstName, presence: true, length: { maximum: 25 }
  
  validates :lastName, presence: true, length: { maximum: 25 }
  
  validates :phoneNumber, presence: true, 
            format: { with: VALID_PHONE_REGEX, message: "Please Enter a Valid Phone Number" }
            
  validates :email, presence: true, length: { maximum: 254 }, 
            format: { with: VALID_EMAIL_REGEX , message: "Please Enter a Valid Eemail Address" }
            
  validates :addressLine1, presence: true, length: { maximum: 50 }
  
  validates :addressLine2, presence: true, length: { maximum: 50 }
  
  validates :province, presence: true, length: { maximum: 25 }
  
  validates :city, presence: true, length: { maximum: 25 }
  
  validates :postalCode, presence: true, 
            format: { with: VALID_POSTALCODE_REGEX, message: "Please Enter a Valid Postal Code" }
end
