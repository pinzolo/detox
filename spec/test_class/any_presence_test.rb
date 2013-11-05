# coding: utf-8
require "test_class/model_base"

class AnyPresenceTest < ModelBase
  attr_accessor :values

  validates :values, :any_presence => true
end

class AnyPresenceTestWithMinValidCountOnly < ModelBase
  attr_accessor :values

  validates :values, :any_presence => { :min_valid_count => 2 }
end

class AnyPresenceTestWithMaxValidCountOnly < ModelBase
  attr_accessor :values

  validates :values, :any_presence => { :max_valid_count => 3 }
end

class AnyPresenceTestWithBothValidCount < ModelBase
  attr_accessor :values

  validates :values, :any_presence => { :min_valid_count => 2, :max_valid_count => 3 }
end

class AnyPresenceTestWithMessageOption < ModelBase
  attr_accessor :values

  validates :values, :any_presence => { :message => "is invalid" }
end

