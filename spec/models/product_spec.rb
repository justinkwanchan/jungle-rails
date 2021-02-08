require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    context 'given a complete new product' do
      it 'will successfully save' do
        @category = Category.create(name: 'Fashion')
        @product = @category.products.create(
          name: 'Strawberry Tie',
          price: 1499,
          quantity: 64,
        )
        expect(@product).to be_valid
      end
    end

    context 'given a new product with no name' do
      it 'will not successfully save' do
        @category = Category.create(name: 'Fashion')
        @product = @category.products.create(
          name: nil,
          price: 1499,
          quantity: 64,
        )
        expect(@product.errors.full_messages[0]).to eq("Name can't be blank")
      end
    end

    context 'given a new product with no price' do
      it 'will not successfully save' do
        @category = Category.create(name: 'Fashion')
        @product = @category.products.create(
          name: 'Strawberry Tie',
          price: nil,
          quantity: 64,
        )
        expect(@product.errors.full_messages[0]).to eq("Price cents is not a number")
      end
    end

    context 'given a new product with no quantity' do
      it 'will not successfully save' do
        @category = Category.create(name: 'Fashion')
        @product = @category.products.create(
          name: 'Strawberry Tie',
          price: 1499,
          quantity: nil,
        )
        expect(@product.errors.full_messages[0]).to eq("Quantity can't be blank")
      end
    end
    
    context 'given a new product with no category' do
      it 'will not successfully save' do
        @product = Product.create(
          name: 'Strawberry Tie',
          price: 1499,
          quantity: 64,
          category: nil
          )
        expect(@product.errors.full_messages[0]).to eq("Category can't be blank")
      end
    end
  end
end
