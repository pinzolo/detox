# coding: utf-8
require "test_class/model_base"

class AnyNumericalityTest < ModelBase
  attr_accessor :prices

  validates :prices, :any_numericality => true
end

class AnyNumericalityTestWithMinValidCountOnly < ModelBase
  attr_accessor :prices

  validates :prices, :any_numericality => { :min_valid_count => 2 }
end

class AnyNumericalityTestWithMaxValidCountOnly < ModelBase
  attr_accessor :prices

  validates :prices, :any_numericality => { :max_valid_count => 3 }
end

class AnyNumericalityTestWithBothValidCount < ModelBase
  attr_accessor :prices

  validates :prices, :any_numericality => { :min_valid_count => 2, :max_valid_count => 3 }
end

class AnyNumericalityTestWithMessageOption < ModelBase
  attr_accessor :prices

  validates :prices, :any_numericality => { :message => "is invalid" }
end



