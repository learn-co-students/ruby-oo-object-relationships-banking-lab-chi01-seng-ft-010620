class Transfer

  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if @sender.balance < @amount
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif valid? == false
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    else 
      if @status == "pending"
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete"
      end
    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.balance -= @amount
      @sender.deposit(@amount)
      @status = "reversed"
  else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  # def reverse_transfer
  #   if @status == "complete"
  #     @status = "reversed"
  #     @sender.balance += @amount
  #     @receiver.balance -= @amount
  #   end
  # end

end
