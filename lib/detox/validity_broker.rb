# coding: utf-8
module Detox
  class ValidityBroker
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
      def initialize(broker)
        @broker = broker
      end

      def add(*inane_args)
        @broker.invaliditize
      end

      def clear
        @broker.validitize
      end
    end
  end
end
