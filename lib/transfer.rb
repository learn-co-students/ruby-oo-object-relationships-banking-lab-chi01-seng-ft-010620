require 'pry'

class Transfer
  attr_reader :status 

  attr_accessor :sender, :receiver, :amount
  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end


  def execute_transaction    # sender loses $$
    if @status == "pending" && self.valid? && @sender.balance > @amount
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else 
      # 
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete" && self.valid? && @receiver.balance > @amount
       @receiver.balance -= @amount
       @sender.balance += @amount
       @status = "reversed"
    end
  end

  

end
