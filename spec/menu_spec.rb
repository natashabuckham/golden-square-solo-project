require 'menu'

RSpec.describe Menu do
  it "returns the list of dishes and their prices" do
    menu = Menu.new
    expect(menu.view).to eq "dish_1: £10\ndish_2: £20\ndish_3: £5"
  end

  it "returns a requested dish-price k:v pair as an array" do
    menu = Menu.new
    expect(menu.select("dish_1")).to eq [:dish_1, 10]
  end
end
