class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(sum)
    self.balance += sum
  end

  def display_balance
    return "Your balance is $#{self.balance}."
  end

  def valid?
    return (self.status == "open" && self.balance > 0)
  end

  def close_account
    self.status = "closed"
  end
end
