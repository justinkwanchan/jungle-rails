require 'rails_helper'

RSpec.feature "Visitor adds a product to their cart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end
  
  scenario "They see the cart quantity increase" do
    visit root_path
    
    expect(page.find(:link, 'My Cart')).to have_content('My Cart (0)')
    
    page.find('button[type="submit"]', match: :first).click

    sleep 1

    expect(page.find(:link, 'My Cart')).to have_content('My Cart (1)')
  end

end