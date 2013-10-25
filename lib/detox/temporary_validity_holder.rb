# coding: utf-8
module Detox
  class TemporaryValidityHolder
    attr_reader :errors

    def initialize
      @validity = true
      @errors = Errors.new(self)
    end

    def valid?
      value = @validity
      validitize
      value
    end

    def invalid?
      value = @validity
      validitize
      !value
    end

    def validitize
      @validity = true
    end

    def invaliditize
      @validity = false
    end

    class Errors
      def initialize(holder)
        @holder = holder
      end

      def add(*inane_args)
        @holder.invaliditize
      end

      def clear
        @holder.validitize
      end
    end
  end
end
