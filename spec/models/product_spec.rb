require "rails_helper"

RSpec.describe Product, type: :model do
  describe "Validations" do
    it "should create a new product in a new category" do
      @category = Category.create(name: "Category")
      @product = Product.create(name: "Plant", category: @category, quantity: 2, price: 100)
      @product.save!
      expect(@product).to be_valid
    end

    it "should not allow to create a new product if name is blank" do
      @category = Category.create(name: "Category")
      @product = Product.create(category: @category, quantity: 2, price: 100)
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "should not allow to create a new product if category is blank" do
      @category = Category.create(name: "Category")
      @product = Product.create(name: "Plant", quantity: 2, price: 100)
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

    it "should not allow to create a new product if quantity is blank" do
      @category = Category.create(name: "Category")
      @product = Product.create(name: "Plant", category: @category, price: 100)
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "should not allow to create a new product if price is blank" do
      @category = Category.create(name: "Category")
      @product = Product.create(name: "Plant", category: @category, quantity: 2)
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
  end
end
