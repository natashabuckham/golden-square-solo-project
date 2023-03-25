require 'customer_order'

RSpec.describe CustomerOrder do
  it "adds dishes of a specified quantity to the order and displays the order" do
    order = CustomerOrder.new
    order.add([:dish_1, 10], 2) # double menu.select?
    order.add([:dish_2, 20], 3)
    expect(order.view).to eq "2x dish_1: £20\n3x dish_2: £60"
  end

  it "returns a grand total price" do
    order = CustomerOrder.new
    order.add([:dish_1, 10], 2) # double menu.select?
    order.add([:dish_2, 20], 3)
    expect(order.grand_total).to eq "£80"
  end

  it "returns an itemised receipt with the grand total" do
    order = CustomerOrder.new
    order.add([:dish_1, 10], 2) # double menu.select?
    order.add([:dish_2, 20], 3)
    expect(order.receipt).to eq "2x dish_1: £20\n3x dish_2: £60\nTotal: £80"
  end
end
