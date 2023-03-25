require 'menu'
require 'customer_order'

RSpec.describe "integration" do
  it "selects a dish from the menu and adds it to the order" do
    menu = Menu.new
    order = CustomerOrder.new
    selected_dish = menu.select("dish_1")
    order.add(selected_dish, 2)
    expect(order.view).to eq "2x dish_1: £20"
  end

  it "adds dishes to order and shows an itemised receipt" do
    menu = Menu.new
    order = CustomerOrder.new
    selected_dish_1 = menu.select("dish_1")
    selected_dish_2 = menu.select("dish_2")
    order.add(selected_dish_1, 2)
    order.add(selected_dish_2, 3)
    expect(order.receipt).to eq "2x dish_1: £20\n3x dish_2: £60\nTotal: £80"
  end
end
