# coding: utf-8
require "test_class/model_base"

class AnyAcceptanceTest < ModelBase
  attr_accessor :flags

  validates :flags, :any_acceptance => true
end

class AnyAcceptanceTestWithMinValidCountOnly < ModelBase
  attr_accessor :flags

  validates :flags, :any_acceptance => { :min_valid_count => 2 }
end

class AnyAcceptanceTestWithMaxValidCountOnly < ModelBase
  attr_accessor :flags

  validates :flags, :any_acceptance => { :max_valid_count => 3 }
end

class AnyAcceptanceTestWithBothValidCount < ModelBase
  attr_accessor :flags

  validates :flags, :any_acceptance => { :min_valid_count => 2, :max_valid_count => 3 }
end

class AnyAcceptanceTestWithMessageOption < ModelBase
  attr_accessor :flags

  validates :flags, :any_acceptance => { :message => "is invalid" }
end


