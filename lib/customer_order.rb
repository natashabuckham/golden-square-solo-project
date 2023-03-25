class CustomerOrder
  def initialize
    @order = {} # what if a quantity of a dish is already present and you want to add more? need a conditional
  end

  def add(item_array, quantity)
    @order[item_array] = quantity.to_i
  end

  def view
    string = ""
    @order.each do |item_array, quantity|
      string += "#{quantity}x #{item_array[0]}: £#{item_array[1] * quantity}\n"
    end
    string.chomp
  end

  def grand_total
    total = 0
    @order.each do |item_array, quantity|
      total += item_array[1] * quantity
    end
    "£#{total}"
  end

  def receipt
    "#{view}\nTotal: #{grand_total}"
  end
end
