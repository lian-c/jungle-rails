require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it "validate will save" do
      user = User.new(name: "Mary Poppins", price: 109.00, quantity: 21, category: @category)
      expect(product.save).to be true
    end

    it "validates presence of name" do
      @product = Product.create(name: nil, price: 20.99, quantity: 50, category: @category)
      @product.valid?
      expect(@product.errors[:name]).to eql (["can't be blank"])
    end
    it "validates presence of price" do
      @product = Product.create(name: "Blossom Tree", quantity: 50, category: @category)
      @product.valid?
      expect(@product.errors[:price]).to include("can't be blank")
    end
    it "validates presence of quantity" do
      @product = Product.create(price: 20.99, name: "Blossom Tree", quantity: nil, category: @category)
      @product.valid?
      expect(@product.errors[:quantity]).to include("can't be blank")
    end
    it "validates presence of category" do
      @product = Product.create(name: "Blossom Tree", price: 20.99, quantity: 50, category: nil)
      @product.valid?
      expect(@product.errors[:category]).to include("can't be blank")
    end

  end
end
