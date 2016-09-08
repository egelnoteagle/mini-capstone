class Product < ApplicationRecord
  # def sale_message
  #   if price.to_f > 20
  #     "Discount Item!"
  #   else  
  #     "On Sale!"
  #   end  
  # end 

  def tax
    price.to_f * 0.09
  end 

  def total
    price.to_f + tax
  end

  def discounted?
    price.to_f < 20
  end
end
