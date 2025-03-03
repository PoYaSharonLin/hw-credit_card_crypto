# frozen_string_literal: true

# top level document
module LuhnValidator
  # frozen_string_literal: true

  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum(number)
    nums_a = number.to_s.chars.map(&:to_i)

    # TODO: use the integers in nums_a to validate its last check digit

    # step1: Drop the check digit
    payload = nums_a[0..-2]
    # step2: transform
    payload = transform_payload(payload)

    # step3: sum
    sum = payload.sum

    # step4: validation
    check_digit = (10 - (sum % 10)) % 10
    puts check_digit == nums_a[0..-1]
  end
end

private

def transform_payload(payload)
  payload.each_with_index do |value, index|
    if index.even?
      value *= 2
      value -= 9 if value > 9
    end
    payload[index] = value
  end
  payload
end

# local test

# class Validator
#   include LuhnValidator
# end

# validator = Validator.new
# validator.validate_checksum(11111)
