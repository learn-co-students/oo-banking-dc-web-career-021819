require_relative "./bank_account.rb"

class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    return (sender.valid? && receiver.valid?)
  end

  def execute_transaction
    #pending
    #Exchange
    if (valid? && (sender.balance >= self.amount) && self.status == "pending") #both accounts are open and there is enough
      sender.deposit (-self.amount)
      receiver.deposit (self.amount)

      self.status = "complete"
    else
      self.status = "rejected"    #One of the accounts is not open
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if (self.status == "complete")
      sender.deposit (self.amount)
      receiver.deposit (-self.amount)
      self.status = "reversed"
    end
  end
end
