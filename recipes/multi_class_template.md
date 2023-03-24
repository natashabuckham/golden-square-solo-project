# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices.

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes.

As a customer
So that I can verify that my order is correct
I would like to see an itemised receipt with a grand total.

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.

verbs = see menu, select a number of dishes - make order, see itemised receipt, receive text after order placed
nouns = list of dishes with prices, itemised receipt with grand total price, API text with estimated delivery time

## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```
Interactive food delivery class (run from here)

menu
- contains list of dishes (pre-added) hash? name and price {name: price, name: price, name: price} - it's a class so will it be initialised with same list every time?
- view - puts out list of dishes
- select/add an individual to order? or in the order class? order by name - how to add multiple of the same item?

dish class?

customer_order
- list of items in order - returns nothing
- stored dishes from order and their associated prices
- receipt could be in here?

receipt
- view receipt - itemised + grand total
- total price

(confirmation)
(- receive confirmation)

```

_Also design the interface of each class in more detail._

```ruby
class Menu
  def initialize
    @dishes = [] # list of dishes as hashes
  end

 def view
    # Returns a list of @dishes
  end

  def add(dish, quantity) # dish is a hash containing key(name) - value(price)
    # dish gets added to CustomerOrder
    # Returns nothing
  end
end

class CustomerOrder
  def initialize
   @order = [] # list of dishes as hashes as keys, quantity as value
  end

  def view
    # returns order so far
  end

  def view_receipt(calculate_total, @order)
    # view + calculate total
    # returns itemised receipt with grand total
  end

private

  def calculate_total(@order)
    # returns grand total price
  end
end

class ConfirmationText
  def initialize(order_time)
    @order_time = Time.now # can double this for testing
  end

  def create_text
    @delivery_time = @order_time + 1 hour
    # returns text copy with delivery_time variable
  end

  def send(create_text) # communicates with Twilio API
    @text_content # string containing delivery_time
  end
end

class UserInterface
  def intialize(io, menu, order)
    @io = io # creates a double for Kernel so we can test gets and puts methods
    @menu = menu # can be a new instance of Menu or a double
    @order = order # can be a new instance of CustomerOrder or a double
  end

  def run(action_choice) # choice 1, 2, 3, or 4, default is 0
    # contains the logic for switching between menu items?
    # based on user action choice - calls the menu, order or finalise methods
    # then calls the view method again, unless finalise
  end

  def view
    # action 1 - view list
    @action_list = # string
    # puts the action list
    # asks user for input to choose which action to take - returns value based on their action choice
  end

  def menu # action 2 - view menu
    # menu.view - view the menu
  end

  def order # action 3 - add dish(es)
    # puts which dish would you like to add to your order
    # gets @dish - string
    # puts how many of this dish would you like to add
    # gets @quantity - integer
    # menu.add(dish, quantity) - adds to CustomerOrder
    # order.view - puts order so far
  end

  def receipt
    # order.view_receipt
  end

  def finalise # action 4 - finalise order
  # confirmation.send
  end
end

```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# EXAMPLE

# View action list
menu = Menu.new
order = CustomerOrder.new
io = double :io
interface = UserInterface.new(menu, order, io)
interface.run # => puts "Welcome to the food ordering app. Choose one of the following options by typing 1, 2, 3 or 4."
# Then does interface.view

# View the menu
menu = Menu.new
order = CustomerOrder.new
io = double :io
interface = UserInterface.new(menu, order, io)
interface.run
interface.view
action_choice = io.gets.chomp # 1
interface.run(action_choice)
interface.menu
menu.view # => list of dishes

# Add dishes to order
menu = Menu.new
order = CustomerOrder.new
io = double :io
interface = UserInterface.new(menu, order, io)
interface.run
interface.view
action_choice = io.gets.chomp # 2
interface.run(action_choice)
interface.order # => puts which dish would you like to order, gets @dish, puts how many, gets @quantity, menu.add(dish, quantity)
order.view # => returns order so far as list of dishes, quantities, and prices

# See receipt
menu = Menu.new
order = CustomerOrder.new
io = double :io
interface = UserInterface.new(menu, order, io)
interface.run
interface.view
action_choice = io.gets.chomp # 3
interface.run(action_choice)
order.view_receipt # => puts order.view - returns order so far, puts calculate_total - the grand total price for the order

# Finalise order and get confirmation text
menu = Menu.new
order = CustomerOrder.new
io = double :io
customer = double :customer
interface = UserInterface.new(menu, order, io)
interface.run
interface.view
action_choice = io.gets.chomp #4
interface.run(action_choice)
interface.finalise # => confirmation.send, customer receives text
```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE

# Constructs a track
track = Track.new("Carte Blanche", "Veracocha")
track.title # => "Carte Blanche"
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._
