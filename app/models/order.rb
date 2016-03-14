class Order < ActiveRecord::Base
  belongs_to :user
  
  phone_number = /\d{3}-\d{3}-\d{4}/
  email_address = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  canadian_postal_code = /\A[ABCEGHJKLMNPRSTVXY]{1}\\d{1}[A-Z]{1}[ -]?\\d{1}[A-Z]{1}\\d{1}\z/
  
  validates :user_id, presence: true
  validates :orderDate, presence: true
  validates :firstName, presence: true, length: { maximum: 25 }
  validates :lastName, presence: true, length: { maximum: 25 }
  validates :phoneNumber, presence: true, format: { with: phone_number, message: "Please Enter a Valid Phone Number" }
  validates :email, presence: true, format: { with: email_address, message: "Please Enter a Valid Eemail Address" }
  validates :addressLine1, presence: true, length: { maximum: 50 }
  validates :addressLine2, presence: true, length: { maximum: 50 }
  validates :province, presence: true, length: { maximum: 25 }
  validates :city, presence: true, length: { maximum: 25 }
  validates :postalCode, presence: true, format: { with: canadian_postal_code, message: "Please Enter a Valid Postal Code" }
end
