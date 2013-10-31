# coding: utf-8
require "test_class/model_base"

class PossessionTestWithSingleTarget < ModelBase
  attr_accessor :values

  validates :values, :possession => { :target => "3" }
end

class PossessionTestWithArrayTarget < ModelBase
  attr_accessor :values

  validates :values, :possession => { :target => ["2", "3"] }
end

class PossessionTestWithMessageOption < ModelBase
  attr_accessor :values

  validates :values, :possession => { :target => "3", :message => "is invalid" }
end


