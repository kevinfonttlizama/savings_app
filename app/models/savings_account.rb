class SavingsAccount < ApplicationRecord
  def self.invest(investment_amount)
    remaining_investment = investment_amount

    while remaining_investment > 0

      exact_match_account = SavingsAccount.find_by(balance: remaining_investment)
      if exact_match_account
        exact_match_account.update(balance: 0)
        remaining_investment = 0
      else

        greater_balance_account = SavingsAccount.where('balance >= ?', remaining_investment).order(balance: :desc).first
        if greater_balance_account
          deduction = [greater_balance_account.balance, remaining_investment].min
          greater_balance_account.update(balance: greater_balance_account.balance - deduction)
          remaining_investment -= deduction
        else
          break
        end
      end
    end
  end
end


#SavingsAcount.invest(amount)
#
##the acounts are in the db table 
