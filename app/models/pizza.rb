class Pizza < ActiveRecord::Base
  belongs_to :order
  before_save :format_toppings
  
  default_scope -> { order(created_at: :desc) }

  validates :order_id, presence: true
  
  validates :pizza_type, presence: true, length: { maximum: 25 }
  
  validates :pizza_size, presence: true, length: { maximum: 25 }

  validates :toppings, presence: true, length: { maximum: 254 }
  
  validates :crust, presence: true, length: { maximum: 254 }
  
  protected
    def format_toppings
      self.toppings.gsub!(/[\[\]\"]/, "") if attribute_present?("toppings")
    end
end
