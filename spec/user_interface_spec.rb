require 'user_interface'

RSpec.describe UserInterface do
  it "runs the program - view menu" do
    io = double :io
    expect(io).to receive(:puts).with("1. View the menu\n2. Add a dish to your order\n3. See receipt\n4. Finalise order\n\n").ordered
    expect(io).to receive(:puts).with("Enter a number for the action you want to take, or 'exit' to quit the program:").ordered
    expect(io).to receive(:gets).and_return("1").ordered
    expect(io).to receive(:puts).with("\ndish_1: £10\ndish_2: £20\ndish_3: £5\n\n").ordered
    expect(io).to receive(:puts).with("Hit enter when you are ready to return to the action list.").ordered
    expect(io).to receive(:gets).and_return("\n").ordered
    expect(io).to receive(:puts).with("1. View the menu\n2. Add a dish to your order\n3. See receipt\n4. Finalise order\n\n").ordered
    expect(io).to receive(:puts).with("Enter a number for the action you want to take, or 'exit' to quit the program:").ordered
    expect(io).to receive(:gets).and_return("exit").ordered

    interface = UserInterface.new(io, Menu, CustomerOrder) # create doubles for menu and customer order once TDD for interface complete, then put these tests into integration
    interface.run
  end

  it "runs the program - add a dish to order" do
    io = double :io
    expect(io).to receive(:puts).with("1. View the menu\n2. Add a dish to your order\n3. See receipt\n4. Finalise order\n\n").ordered
    expect(io).to receive(:puts).with("Enter a number for the action you want to take, or 'exit' to quit the program:").ordered
    expect(io).to receive(:gets).and_return("2").ordered
    expect(io).to receive(:puts).with("\nEnter the name of the dish you'd like to add:").ordered
    expect(io).to receive(:gets).and_return("dish_1").ordered
    expect(io).to receive(:puts).with("\nHow many of dish_1 would you like to add?").ordered
    expect(io).to receive(:gets).and_return("2").ordered
    expect(io).to receive(:puts).with("\nDish added!\n\nHere is your order so far:\n2x dish_1: £20\n\n").ordered
    expect(io).to receive(:puts).with("Hit enter when you are ready to return to the action list.").ordered
    expect(io).to receive(:gets).and_return("\n").ordered
    expect(io).to receive(:puts).with("1. View the menu\n2. Add a dish to your order\n3. See receipt\n4. Finalise order\n\n").ordered
    expect(io).to receive(:puts).with("Enter a number for the action you want to take, or 'exit' to quit the program:").ordered
    expect(io).to receive(:gets).and_return("exit").ordered

    interface = UserInterface.new(io, Menu, CustomerOrder)
    interface.run
  end

  xit "runs the program - see receipt" do

  end

  it "tells user to input a valid number from the action list" do
    io = double :io
    expect(io).to receive(:puts).with("1. View the menu\n2. Add a dish to your order\n3. See receipt\n4. Finalise order\n\n").ordered
    expect(io).to receive(:puts).with("Enter a number for the action you want to take, or 'exit' to quit the program:").ordered
    expect(io).to receive(:gets).and_return("5").ordered
    expect(io).to receive(:puts).with("Invalid input. Please input number 1, 2, 3, 4, or 'exit' to quit the program.").ordered
    expect(io).to receive(:puts).with("Hit enter when you are ready to return to the action list.").ordered
    expect(io).to receive(:gets).and_return("\n").ordered
    expect(io).to receive(:puts).with("1. View the menu\n2. Add a dish to your order\n3. See receipt\n4. Finalise order\n\n").ordered
    expect(io).to receive(:puts).with("Enter a number for the action you want to take, or 'exit' to quit the program:").ordered
    expect(io).to receive(:gets).and_return("exit").ordered

    interface = UserInterface.new(io, Menu, CustomerOrder)
    interface.run
  end
end
