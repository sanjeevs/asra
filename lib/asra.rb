require "asra/version"
require 'finance'
require "asra/rental_model"

module Asra
  class Property
    attr_reader :address, :list_price, :tax_value, :sqft, :built
    attr_reader :annual_fees, :annual_maintenance, :annual_insurance

    def initialize(args)
      @address = args[:address]
      @list_price = args[:list_price]
      @tax_value = args[:tax_value] || list_price
      @sqft = args[:sqft]
      @age_built = args[:age_built]
      @annual_fees = args[:annual_fees] || 0
      @annual_maintenance = args[:annual_maintenance] || 600
      @annual_insurance = args[:annual_insurance] || 600
    end
  end

  class Rate
    attr_reader :percent_down, :apr, :duration_months, :rate
    
    def initialize(args= {})
      @percent_down = args[:percent_down] || 25.0
      @apr = args[:apr] || 4.5
      @duration_months = args[:duration_months] || (30*12)
      @rate = Finance::Rate.new(apr/100.0, :apr, duration: duration_months)
    end
  end

  class Loan
    attr_reader :loan_amount, :down_payment, :rate

    def initialize(args)
      @rate = args[:rate] || Rate.new
      @down_payment =  args[:list_price] * rate.percent_down.to_f/100.0
      @loan_amount = args[:list_price] -  down_payment

      @amortization = Finance::Amortization.new(loan_amount, rate.rate)

    end

    def monthly_payment
      @amortization.payment.to_f.round(2) * -1
    end

    def annual_principal_paid
      monthly_payment * 12.0 - @amortization.interest[0,12].sum.to_f.round(2)  
    end
    
  end

end
