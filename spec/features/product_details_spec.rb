require 'rails_helper'

def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end


RSpec.feature "ProductDetails", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'
    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: Random.rand(1..70)
      )
    end
  end
  scenario "They see an individual product" do
    visit root_path
    click_link("Details »", match: :first)
    expect(page).to have_css 'section.products-show', count: 1
    save_and_open_screenshot
  end

end