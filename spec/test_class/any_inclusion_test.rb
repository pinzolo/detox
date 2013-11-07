# coding: utf-8
require "test_class/model_base"

class AnyInclusionTest < ModelBase
  attr_accessor :values

  validates :values, :any_inclusion => { :in => ["1", "2", "3" ] }
end

class AnyInclusionTestWithMinValidCountOnly < ModelBase
  attr_accessor :values

  validates :values, :any_inclusion => { :in => ["1", "2", "3"], :min_valid_count => 2 }
end

class AnyInclusionTestWithMaxValidCountOnly < ModelBase
  attr_accessor :values

  validates :values, :any_inclusion => { :in => ["1", "2", "3"], :max_valid_count => 3 }
end

class AnyInclusionTestWithBothValidCount < ModelBase
  attr_accessor :values

  validates :values, :any_inclusion => { :in => ["1", "2", "3"], :min_valid_count => 2, :max_valid_count => 3 }
end

class AnyInclusionTestWithMessageOption < ModelBase
  attr_accessor :values

  validates :values, :any_inclusion => { :in => ["1", "2", "3"], :message => "is invalid" }
end

