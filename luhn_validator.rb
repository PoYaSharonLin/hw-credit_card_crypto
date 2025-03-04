# frozen_string_literal: true

# top level document
module LuhnValidator
  # frozen_string_literal: true

  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)

    # TODO: use the integers in nums_a to validate its last check digit

    # step1: Drop the check digit
    parity = nums_a.length % 2
    payload = nums_a[0..-2]
    # puts payload
    # step2: Transform payload
    payload_sum = payload_sum(payload, parity)
    # puts payload_sum

    # step3: Sum all resulting digits
    nums_a[-1] == ((10 - (payload_sum % 10)) % 10)
  end

  private

  def payload_sum(payload, parity)
    payload.map.with_index.inject(0) do |sum, (value, index)|
      sum + if index % 2 != parity
              value
            elsif value > 4
              2 * value - 9
            else
              2 * value
            end
    end
  end
end
# local test

# class Validator
#   include LuhnValidator
# end

# validator = Validator.new
# validator.validate_checksum(374242548357378)
