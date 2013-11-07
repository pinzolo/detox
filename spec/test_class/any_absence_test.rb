# coding: utf-8
require "test_class/model_base"

class AnyAbsenceTest < ModelBase
  attr_accessor :values

  validates :values, :any_absence => true
end

class AnyAbsenceTestWithMinValidCountOnly < ModelBase
  attr_accessor :values

  validates :values, :any_absence => { :min_valid_count => 2 }
end

class AnyAbsenceTestWithMaxValidCountOnly < ModelBase
  attr_accessor :values

  validates :values, :any_absence => { :max_valid_count => 3 }
end

class AnyAbsenceTestWithBothValidCount < ModelBase
  attr_accessor :values

  validates :values, :any_absence => { :min_valid_count => 2, :max_valid_count => 3 }
end

class AnyAbsenceTestWithMessageOption < ModelBase
  attr_accessor :values

  validates :values, :any_absence => { :message => "is invalid" }
end

