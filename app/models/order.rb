class Order < ActiveRecord::Base
  belongs_to :user
  has_many :pizzas, dependent: :destroy
  before_save :get_taxrate

  default_scope -> { order(created_at: :desc) }
  
  VALID_PHONE_REGEX = /\d{3}-?\d{3}-?\d{4}/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_POSTALCODE_REGEX = /[ABCEGHJKLMNPRSTVXY][0-9][ABCEGHJKLMNPRSTVWXYZ] ?[0-9][ABCEGHJKLMNPRSTVWXYZ][0-9]/
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
  
  
  def update_subtotal
    self.update_column(:subtotal, self.pizzas.sum(:total_price))
    self.update_column(:total, self.subtotal * self.tax )
  end
  
  protected          
    def get_taxrate
      if self.province == 'ontario'
        self.tax = 1.13
      elsif self.province == 'quebec'
        self.tax = 1.11
      elsif self.province == 'manitoba'
        self.tax = 1.10
      elsif self.province == 'saskatchewan'
        self.tax = 1.15
      else
        self.tax = 1.13
      end
    end
end
