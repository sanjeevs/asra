module Asra

  class RentalModel
    NumMonthsOccupied = 10.0

    attr_accessor :property, :loan, :property_tax
    def initialize(property, rate=Rate.new)
      @property = property
      @loan = Loan.new(rate: rate, list_price: @property.list_price)
      @property_tax = @property.tax_value * 0.01
    end

    def annual_expenses
      (loan.monthly_payment * 12.0 + property_tax + @property.annual_fees +
      @property.annual_maintenance + @property.annual_insurance).to_f
    end

    def min_monthly_rent
      annual_expenses/NumMonthsOccupied
    end

    def annual_income(monthly_rent)
      (monthly_rent * NumMonthsOccupied).to_f
    end

    def annual_profit(monthly_rent)
      (annual_income(monthly_rent) - annual_expenses).to_f
    end

    def rate_of_return(actual_monthly_rent=nil)
      actual_monthly_rent = min_monthly_rent unless actual_monthly_rent
      if(loan.down_payment > 0)
        ((loan.annual_principal_paid + annual_profit(actual_monthly_rent)) / loan.down_payment) * 100.0
      else
        0  # Degenerate case.
      end
    end

  end
end

