# coding: utf-8
require "spec_helper"
require "test_class/model_base"

describe "Any*Validator#check_validity!" do
  context "when no option" do
    it "not raise Error" do
      expect do
        class AnyTestWhenNoOption < ModelBase
          attr_accessor :values
          validates :values, :any_presence => true
        end
      end.not_to raise_error
    end
  end
  context "when :min_valid_count is positive integer and without :max_valid_count" do
    it "not raise Error" do
      expect do
        class AnyTestWhenMinValidCountIsPositiveIntegerAndWithoutMaxValidCount < ModelBase
          attr_accessor :values
          validates :values, :any_presence => { :min_valid_count => 2 }
        end
      end.not_to raise_error
    end
  end
  context "when :min_valid_count is not integer" do
    it "raise ArgumentError(:min_valid_count and :max_valid_count must be a positive integer ( greater than 0 ) or nil)" do
      expect do
        class AnyTestWhenMinValidCountIsNotInteger < ModelBase
          attr_accessor :values
          validates :values, :any_presence => { :min_valid_count => "1" }
        end
      end.to raise_error(ArgumentError, ":min_valid_count and :max_valid_count must be a positive integer ( greater than 0 ) or nil")
    end
  end
  context "when :min_valid_count is negative integer" do
    it "raise ArgumentError(:min_valid_count and :max_valid_count must be a positive integer ( greater than 0 ) or nil)" do
      expect do
        class AnyTestWhenMinValidCountIsNegativeInteger < ModelBase
          attr_accessor :values
          validates :values, :any_presence => { :min_valid_count => -1 }
        end
      end.to raise_error(ArgumentError, ":min_valid_count and :max_valid_count must be a positive integer ( greater than 0 ) or nil")
    end
  end
  context "when :min_valid_count is 0" do
    it "raise ArgumentError(:min_valid_count and :max_valid_count must be a positive integer ( greater than 0 ) or nil)" do
      expect do
        class AnyTestWhenMinValidCountIsZero < ModelBase
          attr_accessor :values
          validates :values, :any_presence => { :min_valid_count => 0 }
        end
      end.to raise_error(ArgumentError, ":min_valid_count and :max_valid_count must be a positive integer ( greater than 0 ) or nil")
    end
  end
  context "when without :min_valid_count and :max_valid_count is positive integer" do
    it "not raise Error" do
      expect do
        class AnyTestWhenWithoutMinValidCountAndMaxValidCountIsPositiveInteger < ModelBase
          attr_accessor :values
          validates :values, :any_presence => { :max_valid_count => 2 }
        end
      end.not_to raise_error
    end
  end
  context "when :max_valid_count is not integer" do
    it "raise ArgumentError(:min_valid_count and :max_valid_count must be a positive integer ( greater than 0 ) or nil)" do
      expect do
        class AnyTestWhenMaxValidCountIsNotInteger < ModelBase
          attr_accessor :values
          validates :values, :any_presence => { :max_valid_count => "1" }
        end
      end.to raise_error(ArgumentError, ":min_valid_count and :max_valid_count must be a positive integer ( greater than 0 ) or nil")
    end
  end
  context "when :max_valid_count is negative integer" do
    it "raise ArgumentError(:max_valid_count and :min_valid_count must be a positive integer ( greater than 0 ) or nil)" do
      expect do
        class AnyTestWhenMaxValidCountIsNegativeInteger < ModelBase
          attr_accessor :values
          validates :values, :any_presence => { :max_valid_count => -1 }
        end
      end.to raise_error(ArgumentError, ":min_valid_count and :max_valid_count must be a positive integer ( greater than 0 ) or nil")
    end
  end
  context "when :max_valid_count is 0" do
    it "raise ArgumentError(:max_valid_count and :min_valid_count must be a positive integer ( greater than 0 ) or nil)" do
      expect do
        class AnyTestWhenMaxValidCountIsZero < ModelBase
          attr_accessor :values
          validates :values, :any_presence => { :max_valid_count => 0 }
        end
      end.to raise_error(ArgumentError, ":min_valid_count and :max_valid_count must be a positive integer ( greater than 0 ) or nil")
    end
  end
  context "when :min_valid_count is greater than :max_valid_count" do
    it "raise ArgumentError(:min_valid_count must be less than :max_valid_count)" do
      expect do
        class AnyTestWhenMinValidCountIsGreaterThanMaxValidCount < ModelBase
          attr_accessor :values
          validates :values, :any_presence => { :min_valid_count => 3, :max_valid_count => 2 }
        end
      end.to raise_error(ArgumentError, ":min_valid_count must be less than :max_valid_count")
    end
  end
  context "when :min_valid_count equals to :max_valid_count" do
    it "not raise Error" do
      expect do
        class AnyTestWhenMaxValidCountEqualsToMaxValidCount < ModelBase
          attr_accessor :values
          validates :values, :any_presence => { :min_valid_count => 3, :max_valid_count => 3 }
        end
      end.not_to raise_error
    end
  end
  context "when :min_valid_count is less than :max_valid_count" do
    it "not raise Error" do
      expect do
        class AnyTestWhenMinValidCountIsLessThanMaxValidCount < ModelBase
          attr_accessor :values
          validates :values, :any_presence => { :min_valid_count => 2, :max_valid_count => 3 }
        end
      end.not_to raise_error
    end
  end
end
