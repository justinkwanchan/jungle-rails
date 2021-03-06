require 'rails_helper'

RSpec.feature "Visitor navigates to the product page by clicking on a product", type: :feature, js: true do

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
  
  scenario "They see the product details" do
    visit root_path
    
    page.find(:link, 'Details »', match: :first).click

    sleep 1

    expect(page).to have_css 'section.products-show', count: 1
  end

end