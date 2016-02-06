require 'byebug'
class CurrencyConverter

  attr_accessor :country_codes, :currency_rates

  def initialize()
    @currency_rates = {USD: 1.0, EUR: 0.74, JPY: 120}
    @country_codes = {EUR: "€", USD: "$", JPY: "¥"}
  end

  def convert(number, code)
    number_code =  number.type
    number_number = number.number
    if @country_codes[code] == nil
      raise UnknownCountryCodeError
    elsif @currency_rates[number.type] == 1.0
      converted_number = number_number.to_f * @currency_rates[code]
    else @currency_rates[number.type] >= 1.0
      converted_number = (number_number.to_f / @currency_rates[number.type]) * @currency_rates[code]
    end
    puts "#{converted_number} #{code}"
  end

end
