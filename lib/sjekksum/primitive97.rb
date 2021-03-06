module Sjekksum
  #
  # Module for calculation and validation of Primitive97 checksums
  #
  # This primitive checksum is based on the modulo 97 (calculation of check digits) and modulo 9 (reduction to a single digit).
  #
  module Primitive97
    extend self
    extend Shared

    #
    # Calculates Primitive97 checksum
    #
    # @example
    #   Sjekksum::Primitive97.of(23569) #=> 5
    #
    # @param  number [Integer, String] number for which the checksum should be calculated
    #
    # @return [Integer] calculated checksum
    def of number
      raise_on_type_mismatch number
      (convert_to_int(number) % 97) % 9
    end
    alias_method :checksum, :of

    #
    # Primitive97 validation of provided number
    #
    # @example
    #   Sjekksum::Primitive97.valid?(235695) #=> true
    #
    # @param  number [Integer, String] number with included checksum
    #
    # @return [Boolean]
    def valid? number
      raise_on_type_mismatch number
      num, check = split_number(number)
      self.of(num) == check
    end
    alias_method :is_valid?, :valid?

    #
    # Transforms a number by appending the Primitive97 checksum digit
    #
    # @example
    #   Sjekksum::Primitive97.convert(23569) #=> 235695
    #
    # @param  number [Integer, String] number without a checksum
    #
    # @return [Integer, String] final number including the checksum
    def convert number
      raise_on_type_mismatch number
      typed_conversion number
    end
    alias_method :transform, :convert

  end
end
