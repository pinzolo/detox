# coding: utf-8
require "test_class/model_base"

class AnyLengthTest < ModelBase
  attr_accessor :values

  validates :values, :any_length => { :in => 4..6 }
end

class AnyLengthTestWithMinValidCountOnly < ModelBase
  attr_accessor :values

  validates :values, :any_length => { :in => 4..6, :min_valid_count => 2 }
end

class AnyLengthTestWithMaxValidCountOnly < ModelBase
  attr_accessor :values

  validates :values, :any_length => { :in => 4..6, :max_valid_count => 3 }
end

class AnyLengthTestWithBothValidCount < ModelBase
  attr_accessor :values

  validates :values, :any_length => { :in => 4..6, :min_valid_count => 2, :max_valid_count => 3 }
end

class AnyLengthTestWithMessageOption < ModelBase
  attr_accessor :values

  validates :values, :any_length => { :in => 4..6, :message => "is invalid" }
end

