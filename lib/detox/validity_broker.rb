# coding: utf-8
module Detox
  class ValidityBroker
    attr_reader :errors
    attr_accessor :validatee

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

    def read_attribute_for_validation(attribute)
      validatee
    end

    class Errors
      def initialize(broker)
        @broker = broker
      end

      def add(*inane_args)
        @broker.invaliditize
      end

      # for support PresenceValidator (version 3.2.x)
      def add_on_blank(*inane_args)
        add(*inane_args) if @broker.validatee.blank?
      end

      def clear
        @broker.validitize
      end
    end
  end
end
