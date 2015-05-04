class BankAccount
  attr_accessor :name 
  attr_accessor :balance

  
  def initialize(name)
     @name = name
     @balance = 500
  end 
  
  def display_balance
    puts "Hi #{name}. Your balance is #{balance}."
  end
 

  def withdraw(amount, user_pin)
    if pin == user_pin
      self.balance -= amount
    else
      pin_error
    end
  end

  def deposit(amount, user_pin)
    if pin == user_pin
      self.balance += amount
    else
      pin_error
    end
  end

  def pin
    @pin = 2345
  end

  def pin_error
    puts "Wrong pin number"
  end

end

account = BankAccount.new("John")
account.display_balance
account.deposit(500, 2345)
account.display_balance
account.withdraw(200, 2345)
account.display_balance
account.deposit(200, 1234)
