require 'test_helper'

class AnterburyLaneTest < Minitest::Test
  def setup
    property = %q< 
    [
      {
        "address": "100 Anterbury Lane",
        "list_price": 158000,
        "sqft": 1742,
        "built": 2000,
        "beds": 3,
        "bathrooms": 2.5,
        "annual_maintenance": 600,
        "annual_insurance": 600,
        "annual_fees": 1404,
        "tax_value": 139784
      }
   ]>
   json_list = JSON.parse(property, symbolize_names: true)
   @json_data = json_list[0]
   @property = Asra::Property.new(@json_data)
   @rental_model = Asra::RentalModel.new(@property)
  end

  def test_annual_expenses
    assert_in_delta(640.45, @rental_model.loan.monthly_payment)
    assert_in_delta(11687.28, @rental_model.annual_expenses, 1.0)
  end

  def test_min_monthly_rent
    assert_in_delta(1169, @rental_model.min_monthly_rent, 1.0)
  end

  def test_rate_of_return
    assert_in_delta(2039, @rental_model.loan.annual_principal_paid, 1)
    assert_in_delta(1200*10, @rental_model.annual_income(1200))
    assert_in_delta(312.78, @rental_model.annual_profit(1200), 1)
    assert_in_delta(7.44, @rental_model.rate_of_return(1200), 0.1)
  end


end

