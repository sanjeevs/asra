# Asra

Given a specification of a property, this computes the minimum rent that the property can support. Utilities 
are not included in the rent and will be paid by the renter.

## Installation

The gem provides several command line utilities for running the model.
  - asra_rent: Computes the monthly rent required for the property.

## Usage

A quick and dirty way to compute the rental income required for the property.

```
$ asra_rent --list 158000 --tax_value 139784 --annual_fees 117
Assuming maintenance = $600/ year (Use --annual_maintenance <amount> to adjust)
Assuming home insurance = $600 / year (Use --yearly_insurance <amount> to adjust)
Min Rent/month needed for 100 Anterbury Lane (Excl Utilities) $1100
```

For a more detailed analysis one should use the json file format as input.
Create a json file for the property say in file test1.json
```
[
  {
    "address": "100 Anterbury Lane",
    "list_price": 158000,
    "annual_fees": 117,
    "sqft": 1742,
    "built": 2000,
    "beds": 3,
    "bathroom": 2.5,
    "annual_maintenance": 600,
    "annual_insurance": 500,
    "tax_value": 139784
  }
]
```

Then run the script.
```
$ asra_rent  --properties test1.json 
Assuming maintenance = $600/ year (Use --yearly_maintenance <amount> to adjust)
Monthly rent needed (Excl Utilities) $1100
```

One can also generate the output in json format.

```
$ asra_rent  -p test1.json -o result.json 
[
  {
    "address": "100 Anterbury Lane",
    "list_price": 158000
    "annual_fees": 117,
    "sqft": 1742,
    "built": 2000,
    "beds": 3,
    "bathroom": 2.5,
    "yearly_maintenance": 600,
    "yearly_insurance": 500,
    "tax_value": 139784
    "down_payment": 30000
    "monthly_rent": 1200
  }
]    
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sanjeevs/asra.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

