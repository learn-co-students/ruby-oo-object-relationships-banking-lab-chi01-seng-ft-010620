class Transfer
  # your code here
attr_reader :sender, :receiver, :amount 
attr_accessor :status  
  

    def initialize(sender, receiver, amount=0, status="pending")
        @sender = sender
        @receiver = receiver 
        @amount = amount 
        @status = status 
    end 

    def valid? 
      @sender.valid? && @receiver.valid?
    end 

    def execute_transaction
   
      if self.status == "pending" && sender.balance >= @amount && self.valid?
        sender.balance -= @amount 
        receiver.balance += @amount 
        self.status = "complete"
      else
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      end 
    end 

    def reverse_transfer
      if execute_transaction
          sender.balance += @amount
          receiver.balance -= @amount 
          self.status = "reversed"
      end 
    end 







end
