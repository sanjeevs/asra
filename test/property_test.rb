require 'test_helper'

class PropertyTest < Minitest::Test
  def setup
    property = %q< 
    [
      {
        "address": "100 Anterbury Lane",
        "list_price": 158000,
        "fees": 117,
        "sqft": 1742,
        "built": 2000,
        "beds": 3,
        "bathrooms": 2.5,
        "yearly_maintenance": 600,
        "yearly_insurance": 500,
        "tax_value": 139784
      }
   ]>
     
   json_list = JSON.parse(property, symbolize_names: true)
   @json_data = json_list[0]
   @property = Asra::Property.new(@json_data)
  end

  def test_json_parameters
    assert_equal "100 Anterbury Lane", @property.address
    assert_equal 158000, @property.list_price
    assert_equal 1742, @property.sqft 
    assert_equal 139784, @property.tax_value
  end

  def test_default_tax_value
    property = Asra::Property.new(list_price: 100)
    assert_equal property.tax_value, 100
  end


end
