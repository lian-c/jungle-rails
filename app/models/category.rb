class Category < ApplicationRecord

  has_many :products

  def prod_in_category
    products.map(&:name)
  end

end
