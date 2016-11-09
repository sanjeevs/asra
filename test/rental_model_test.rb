require 'test_helper'

class RentalModelTest < Minitest::Test
  def setup
    @rental_model1 = Asra::RentalModel.new(Asra::Property.new(list_price: 0,
                                                              annual_fees: 1,
                                                              annual_maintenance: 2,
                                                              annual_insurance: 3))
  end

  def test_min_monthly_payment
    assert_in_delta((1+2+3)/10.0,@rental_model1.min_monthly_rent)
  end

  def test_rate_of_return
    assert_in_delta(0, @rental_model1.rate_of_return)
  end

end

