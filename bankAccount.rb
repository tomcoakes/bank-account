# TO DO:
# Include a deposit method that lets users add money - DONE!
# Include error checking that prevents users from overdrawing - DONE!
# Allow users to set their own PIN - DONE!
# Separate PIN info to a separate module - DONE!
# Create CheckingAccounts or SavingsAccounts that inherit from Account - DONE!
# Add a text interface

module PinInfo

private   # If these weren't private, it would mean that I could call toms_account.pin to read the PIN OR toms_account.pin=(9999) to change the PIN.
  
  def pin
    @pin
  end

  def pin=(value)
    @pin = value
  end

end


class Account
  
  include PinInfo
  attr_reader :name, :balance
  
  def initialize(name, balance, pin=1234)
    @name = name
    @balance = balance
    @pin = pin
  end
  
  def display_balance(pin_number)
    puts pin_number == pin ? "Balance: £#{@balance}." : pin_error
  end
  
  def withdraw(pin_number, amount)
    if pin_number == pin
      unless @balance - amount <= 0
      	@balance -= amount
      	puts "Withdrew £#{amount}. New balance: £#{@balance}."
      else puts "Sorry, but you can't withdraw #{amount}. Your remaining balance is only: £#{@balance}"
      end
    else
      puts pin_error
    end
  end

  def deposit(pin_number, amount)
  	if pin_number == pin
  		@balance += amount
  		puts "Deposited £#{amount}. New balance: £#{@balance}."
  	else
  		puts pin_error
  	end
  end

  def change_pin(pin_number, new_pin)
  	if pin_number == pin
  		@pin = pin=(new_pin)
      puts "You changed your PIN number. Don't forget it!"
    else 
      puts pin_error
  	end
  end

  def pin_error
    "Access denied: incorrect PIN."
  end

end

class CheckingAccount < Account
end

class SavingsAccount < Account
end