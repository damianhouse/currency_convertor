require './currency'
require './currency_converter'
require './DifferentCurrencyCodeError'
require './UnknownCountryCodeError'


currency_converter = CurrencyConverter.new()
puts currency_converter.convert(Currency.new("$1"), :USD) == Currency.new("$1")

puts currency_converter.country_codes[:EUR]

moneyStuff = currency_converter.convert(Currency.new("¥100"), :USD)
