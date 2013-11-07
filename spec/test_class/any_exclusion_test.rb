# coding: utf-8
require "test_class/model_base"

class AnyExclusionTest < ModelBase
  attr_accessor :values

  validates :values, :any_exclusion => { :in => ["4", "5", "6" ] }
end

class AnyExclusionTestWithMinValidCountOnly < ModelBase
  attr_accessor :values

  validates :values, :any_exclusion => { :in => ["4", "5", "6"], :min_valid_count => 2 }
end

class AnyExclusionTestWithMaxValidCountOnly < ModelBase
  attr_accessor :values

  validates :values, :any_exclusion => { :in => ["4", "5", "6"], :max_valid_count => 3 }
end

class AnyExclusionTestWithBothValidCount < ModelBase
  attr_accessor :values

  validates :values, :any_exclusion => { :in => ["4", "5", "6"], :min_valid_count => 2, :max_valid_count => 3 }
end

class AnyExclusionTestWithMessageOption < ModelBase
  attr_accessor :values

  validates :values, :any_exclusion => { :in => ["4", "5", "6"], :message => "is invalid" }
end


