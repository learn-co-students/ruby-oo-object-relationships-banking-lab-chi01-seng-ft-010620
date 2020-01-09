class Transfer
  
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  
  def initialize(sender, receiver, amount, status="pending")
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    if self.sender.valid? && self.receiver.valid?
      true
    end
  end

  # def execute_transaction
  #   if self.status == "pending" && self.sender.balance > @amount && valid?
  #     self.sender.balance -= @amount
  #     self.receiver.balance += @amount
  #     self.status = "complete"
  #   else
  #     "Transaction rejected. Please check your account balance."
  #   end
    
  # end

  def execute_transaction
    if self.sender.balance > @amount && @status == "pending" && valid?
      self.sender.balance -= @amount
      self.receiver.balance += @amount
      @status = "complete"
    else 
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end 
  end 

  def reverse_transfer
    if @status == "complete"
      self.receiver.balance -= @amount
      self.sender.balance += @amount
      @status = "reversed"
    end
  end
  
end
  





