class Pizza < ActiveRecord::Base
  belongs_to :order
  before_save :format_toppings, :get_size_price, :get_toppings_price, :get_crust_price, :get_total_price
  after_save :update_order_subtotal
  
  default_scope -> { order(created_at: :desc) }

  validates :order_id, presence: true
  
  validates :pizza_type, presence: true, length: { maximum: 25 }
  
  validates :pizza_size, presence: true, length: { maximum: 25 }

  #validates :toppings, presence: true, length: { maximum: 254 }
  
  validates :crust, presence: true, length: { maximum: 254 }
  
  protected
    def format_toppings
      self.toppings.gsub!(/[\[\]\"]/, "") if attribute_present?("toppings")
    end
    
    def get_size_price
      if self.pizza_size == 'small'
        self.size_price = 5
      elsif self.pizza_size == 'medium'
        self.size_price = 10
      elsif self.pizza_size == 'large'
        self.size_price = 15
      elsif self.pizza_size == 'X-large'
        self.size_price = 20
      else
        self.size_price = 5
      end
    end
    
    def get_toppings_price
      topping_count = self.toppings.split(",").count
      if topping_count != 0
          self.toppings_price = (topping_count - 1) * 0.50
      end
    end
    
    def get_crust_price
      if self.crust == 'stuffed'
          self.crust_price = 2
      end
    end
    
    def get_total_price
      self.total_price = self.type_price + self.size_price + self.toppings_price + self.crust_price
    end
    
    def update_order_subtotal
      self.order.update_subtotal
    end
end
