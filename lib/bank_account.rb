class BankAccount

attr_reader :name 
attr_accessor :balance, :deposit, :status

def initialize (name)
    @status= "open"
    @name =name
   
    @balance = 1000

end

def deposit(deposit)
    @balance += deposit
end


def display_balance
    p "Your balance is $#{@balance}."
end


def valid?
    @status == "open" && @balance > 0
end

def close_account
@status = "closed"
end

end