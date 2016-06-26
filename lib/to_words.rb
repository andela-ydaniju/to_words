# frozen_string_literal: true
module ToWords
  require "to_words/version"
  require_relative "./to_words/under_hundred.rb"
  require_relative "./to_words/divisions.rb"
  require_relative "./to_words/utils.rb"

  include UnderHundred
  include Divisions
  include Utils

  def to_words
    num = numerical?(self)
    num, sign = check_sign(num)
    return (sign + UNDER_HUNDRED[num]) if num <= 100
    counter = 0
    result = []
    while num != 0
      num, remaining = num.divmod(1000)
      temp_result = result_below_one_thousand(remaining, counter)
      result << temp_result + " " + DIVISIONS[counter] + " " if temp_result
      counter += 1
    end
    sanitize(result, sign)
  end
end

class Fixnum
  include ToWords
end

class String
  include ToWords
end
