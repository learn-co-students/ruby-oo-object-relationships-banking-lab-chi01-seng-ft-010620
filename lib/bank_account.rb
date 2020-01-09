class BankAccount
    attr_reader :name
    attr_accessor :balance, :status


    def initialize(name, balance=1000, status="open")
        @name = name
        @balance = balance
        @status = status
    end

    def deposit(added_money)
        @balance += added_money
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?
        if self.balance > 0 && self.status == "open"
            true
        else
            false
        end
    end

    def close_account
        self.status = "closed"
    end
end
