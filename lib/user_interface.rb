require_relative './menu'
require_relative './customer_order'

class UserInterface
  def initialize(io, menu, order)
    @io = io
    @menu_loose = menu
    @order_loose = order
  end

  def menu
    @menu = @menu_loose.new
  end

  def order
    @order = @order_loose.new
  end

  def run
    menu # intializes menu and order
    order

    action = nil
    until action == "exit" || action == "4"
      @io.puts action_list
      @io.puts "Enter a number for the action you want to take, or 'exit' to quit the program:"
      action = @io.gets.chomp

      case action
        when "1"
          @io.puts "\n" + view_menu + "\n\n"
          @io.puts "Hit enter when you are ready to return to the action list."
          @enter = @io.gets.chomp

        when "2"
          @io.puts "\nEnter the name of the dish you'd like to add:"
          @dish = @io.gets.chomp
          @io.puts "\nHow many of #{@dish} would you like to add?"
          @quantity = @io.gets.chomp
          @io.puts "\nDish added!\n\nHere is your order so far:\n#{add_dish}\n\n"
          @io.puts "Hit enter when you are ready to return to the action list."
          @enter = @io.gets.chomp

        when "exit"
          break

        else
          @io.puts "Invalid input. Please input number 1, 2, 3, 4, or 'exit' to quit the program."
          @io.puts "Hit enter when you are ready to return to the action list."
          @enter = @io.gets.chomp
      end
    end
  end

  def action_list
    "1. View the menu\n2. Add a dish to your order\n3. See receipt\n4. Finalise order\n\n"
  end

  def view_menu
    @menu.view
  end

  def add_dish
    selection = @menu.select(@dish)
    @order.add(selection, @quantity)
    @order.view
  end

  def view_receipt

  end

  def finalise

  end
end


# interface = UserInterface.new(Kernel, Menu, CustomerOrder)
# interface.run
