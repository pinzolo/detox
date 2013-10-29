# coding: utf-8
require "test_class/model_base"

class AllNumericalityTest < ModelBase
  attr_accessor :prices

  validates :prices, :all_numericality => true
end

class AllNumericalityTestWithIgnoreNilValueOption < ModelBase
  attr_accessor :prices

  validates :prices, :all_numericality => { :ignore_nil_value => true }
end

class AllNumericalityTestWithIgnoreBlankValueOption < ModelBase
  attr_accessor :prices

  validates :prices, :all_numericality => { :ignore_blank_value => true }
end

class AllNumericalityTestWithOriginalOption < ModelBase
  attr_accessor :prices

  validates :prices, :all_numericality => { :only_integer => true }
end

class AllNumericalityTestWithMessageOption < ModelBase
  attr_accessor :prices

  validates :prices, :all_numericality => { :message => "is invalid" }
end

