class Menu
  def initialize
    @dishes = { dish_1: 10, dish_2: 20, dish_3: 5 }
  end

  def view
    string = ""
    @dishes.each do |dish, price|
      string += "#{dish}: £#{price}\n"
    end
    string.chomp
  end

  def select(key) # returns a specific dish-price key-value pair as an array to be passed into the customer order add method
    key = key.to_sym
    item_array = []
    item_array.push(key)
    item_array.push(@dishes[key])
    item_array
  end
end
