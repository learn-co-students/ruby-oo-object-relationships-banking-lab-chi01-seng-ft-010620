class Transfer
  
    attr_reader :sender, :receiver
    attr_accessor :status, :amount
    
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
      self.sender.balance += @amount
      self.receiver.balance -= @amount
      @status = "reversed"
      end 
    end 

end
