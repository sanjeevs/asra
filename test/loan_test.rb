require 'test_helper'

class LoanTest < Minitest::Test
  def test_default_loan 
    list_price = 250000
    loan = Asra::Loan.new(list_price: list_price)
    assert_equal 0.25 * list_price, loan.down_payment
    assert_in_delta(950.03, loan.monthly_payment, 0.0)
    assert_in_delta(3024.72, loan.annual_principal_paid)
  end
  
  def test_loan2 
    list_price = 206250
    loan = Asra::Loan.new(list_price: list_price, 
                          rate: Asra::Rate.new(percent_down: 20, apr: 3.47))
    assert_equal 0.20 * list_price, loan.down_payment
    assert_in_delta(738.16, loan.monthly_payment, 0.0)
    assert_in_delta(3182.73, loan.annual_principal_paid)
  end

end

