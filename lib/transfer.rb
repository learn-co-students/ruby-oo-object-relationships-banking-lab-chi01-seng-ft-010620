class Transfer
  # your code here
  attr_reader :amount
  attr_accessor :sender, :receiver, :status
def initialize (sender, receiver, amount)
  @sender = sender
  @receiver = receiver
  @status = "pending"
  @amount ||= amount
end

def valid?
  @sender.valid? && @receiver.valid?
end

def execute_transaction
  if @status == "pending" && self.valid? && @sender.balance > @amount
      @sender.balance -=  @amount
      @receiver.balance += @amount
      @status = "complete"
  else 
        @status = "rejected"
    p "Transaction rejected. Please check your account balance."
  end
end

  def reverse_transfer
    if @status == "complete" && self.valid? && @receiver.balance > @amount
      @sender.balance += @amount 
      @receiver.balance -= @amount 
      @status = "reversed"
    end
  end



end
