require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should create a product if all validations are true' do
      @category = Category.create(name: "TestCat")
      @product = Product.create(
        name: "Shirt",
        price_cents: 300,
        quantity: 23,
        :category => @category
      )
      @product.valid?
      expect(@product.errors).not_to include("can't be blank")
    end
    it 'should not create a product if the name is missing' do
      @category = Category.create(name: "testing")
      @product = Product.create(
        price_cents: 300,
        quantity: 23,
        :category => @category
      )
      @product.valid?   
      expect(@product.errors[:name]).to include("can't be blank")
      end

      it 'should not create a product if there is not a price ' do
        @category = Category.create(name: "testing")
        @product = Product.create(
          name: "Shirt",
          quantity: 23,
          :category => @category
        )
        @product.valid?
        expect(@product.errors[:price_cents]).to include("is not a number")
        end

        it 'should not create a product if there is not a quantity' do
          @category = Category.create(name: "testing")
          @product = Product.create(
            name: "Shirt",
            price_cents: 300,
            :category => @category
          )
          @product.valid?   
          expect(@product.errors[:quantity]).to include("can't be blank")
          end

          it 'should not create a product if there is not a Category' do
            @category = Category.create(name: "testing")
            @product = Product.create(
              name: "Shirt",
              price_cents: 300,
              quantity: 23,
            )
            @product.valid?   
            expect(@product.errors[:category]).to include("can't be blank")
            end
  end
end