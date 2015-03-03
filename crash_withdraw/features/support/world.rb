include Capybara::DSL
module KnowsMyAccount
  class UserInterface
	include Capybara::DSL
    def withdraw_from(account,amount)
		Sinatra::Application.account = account
		visit '/'
		fill_in 'Amount', with: amount
		click_button 'Withdraw'
	end
  end
  def my_account
  	@account ||= Account.new
  end

  def cash_slot
#	@cash_slot ||= CashSlot.new
	Sinatra::Application.cash_slot
  end
	
  def teller
#   @teller ||= Teller.new(cash_slot)	  
    @teller ||= UserInterface.new
  end
end

World(KnowsMyAccount)