class Order < ActiveRecord::Base
  belongs_to :user
  VALID_PHONE_REGEX = /\d{3}-\d{3}-\d{4}/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_POSTALCODE_REGEX = /\A[ABCEGHJKLMNPRSTVXY]{1}\\d{1}[A-Z]{1}[ -]?\\d{1}[A-Z]{1}\\d{1}\z/
  validates :user_id, presence: true
  
  validates :first_name, presence: true, length: { maximum: 25 }
  
  validates :last_name, presence: true, length: { maximum: 25 }
  
  validates :phone_number, presence: true, 
            format: { with: VALID_PHONE_REGEX, message: "Please Enter a Valid Phone Number" }
            
  validates :email, presence: true, length: { maximum: 254 }, 
            format: { with: VALID_EMAIL_REGEX , message: "Please Enter a Valid Eemail Address" }
            
  validates :address_line1, presence: true, length: { maximum: 50 }
  
  validates :address_line2, presence: true, length: { maximum: 50 }
  
  validates :province, presence: true, length: { maximum: 25 }
  
  validates :city, presence: true, length: { maximum: 25 }
  
  validates :postal_code, presence: true, 
            format: { with: VALID_POSTALCODE_REGEX, message: "Please Enter a Valid Postal Code" }
end
