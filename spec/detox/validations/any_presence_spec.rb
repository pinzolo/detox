# coding: utf-8
require "spec_helper"
require "active_support/i18n"
require "test_class/any_presence_test"

describe Detox::Validations::AnyPresenceValidator do
  describe "validation result" do
    context "when given no additional option" do# {{{
      let(:test) { AnyPresenceTest.new }

      context "when apply to nil" do
        it "is valid" do
          test.values = nil
          expect(test.valid?).to eq true
        end
      end

      context "when apply to Array" do# {{{
        context "when apply to [] (empty)" do
          it "is valid" do
            test.values = []
            expect(test.valid?).to eq true
          end
        end
        context "when apply to [nil, '', '   '] (all values are nil or empty or blank)" do
          it "is invalid" do
            test.values = [nil, "", "   "]
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['1', nil, nil, nil, nil] (1 valid value)" do
          it "is valid" do
            test.values = ["1", nil, nil, nil, nil]
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', nil, nil, nil] (2 valid values)" do
          it "is valid" do
            test.values = ["1", "2", nil, nil, nil]
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', '3', nil, nil] (3 valid values)" do
          it "is valid" do
            test.values = ["1", "2", "3", nil, nil]
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', '3', '4', nil] (4 valid values)" do
          it "is valid" do
            test.values = ["1", "2", "3", "4", nil]
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', '3', '4', '5'] (all valid values)" do
          it "is valid" do
            test.values = ["1", "2", "3", "4", "5"]
            expect(test.valid?).to eq true
          end
        end
      end# }}}

      context "when apply to Hash" do# {{{
        context "when apply to {} (empty)" do
          it "is valid" do
            test.values = {}
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => nil, :b => nil, :c => nil, :d => nil :e => nil } (all values are nil or empty or blank)" do
          it "is invalid" do
            test.values = { :a => nil, :b => "", :c => "   " }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => nil, :c => nil, :d => nil :e => nil } (1 valid value)" do
          it "is valid" do
            test.values = { :a => "1", :b => nil, :c => nil, :d => nil, :e => nil }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => nil, :d => nil :e => nil } (2 valid values)" do
          it "is valid" do
            test.values = { :a => "1", :b => "2", :c => nil, :d => nil, :e => nil }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '3', :d => nil, :e => nil } (3 valid values)" do
          it "is valid" do
            test.values = { :a => "1", :b => "2", :c => nil, :d => nil, :e => nil }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '3', :d => '4', :e => nil } (4 valid values)" do
          it "is valid" do
            test.values = { :a => "1", :b => "2", :c => "3", :d => nil, :e => nil }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '3', :d => '4', :e => '5' } (all valid values)" do
          it "is valid" do
            test.values = { :a => "1", :b => "2", :c => "3", :d => "4", :e => "5" }
            expect(test.valid?).to eq true
          end
        end
      end# }}}
    end# }}}

    context "when given only :min_valid_count option" do# {{{
      let(:test) { AnyPresenceTestWithMinValidCountOnly.new }

      context "when apply to nil" do
        it "is valid" do
          test.values = nil
          expect(test.valid?).to eq true
        end
      end

      context "when apply to Array" do# {{{
        context "when apply to [] (empty)" do
          it "is valid" do
            test.values = []
            expect(test.valid?).to eq true
          end
        end
        context "when apply to [nil, '', '   '] (all values are nil or empty or blank)" do
          it "is invalid" do
            test.values = [nil, "", "   "]
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['1', nil, nil, nil, nil] (1 valid value)" do
          it "is invalid" do
            test.values = ["1", nil, nil, nil, nil]
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['1', '2', nil, nil, nil] (2 valid values)" do
          it "is valid" do
            test.values = ["1", "2", nil, nil, nil]
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', '3', nil, nil] (3 valid values)" do
          it "is valid" do
            test.values = ["1", "2", "3", nil, nil]
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', '3', '4', nil] (4 valid values)" do
          it "is valid" do
            test.values = ["1", "2", "3", "4", nil]
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', '3', '4', '5'] (all valid values)" do
          it "is valid" do
            test.values = ["1", "2", "3", "4", "5"]
            expect(test.valid?).to eq true
          end
        end
      end# }}}

      context "when apply to Hash" do# {{{
        context "when apply to {} (empty)" do
          it "is valid" do
            test.values = {}
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => nil, :b => nil, :c => nil, :d => nil :e => nil } (all values are nil or empty or blank)" do
          it "is invalid" do
            test.values = { :a => nil, :b => "", :c => "   " }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => nil, :c => nil, :d => nil :e => nil } (1 valid value)" do
          it "is invalid" do
            test.values = { :a => "1", :b => nil, :c => nil, :d => nil, :e => nil }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => nil, :d => nil :e => nil } (2 valid values)" do
          it "is valid" do
            test.values = { :a => "1", :b => "2", :c => nil, :d => nil, :e => nil }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '3', :d => nil, :e => nil } (3 valid values)" do
          it "is valid" do
            test.values = { :a => "1", :b => "2", :c => "3", :d => nil, :e => nil }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '3', :d => '4', :e => nil } (4 valid values)" do
          it "is valid" do
            test.values = { :a => "1", :b => "2", :c => "3", :d => "4", :e => nil }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '3', :d => '4', :e => '5' } (all valid values)" do
          it "is valid" do
            test.values = { :a => "1", :b => "2", :c => "3", :d => "4", :e => "5" }
            expect(test.valid?).to eq true
          end
        end
      end# }}}
    end# }}}

    context "when given only :max_valid_count option" do# {{{
      let(:test) { AnyPresenceTestWithMaxValidCountOnly.new }

      context "when apply to nil" do
        it "is valid" do
          test.values = nil
          expect(test.valid?).to eq true
        end
      end

      context "when apply to Array" do# {{{
        context "when apply to [] (empty)" do
          it "is valid" do
            test.values = []
            expect(test.valid?).to eq true
          end
        end
        context "when apply to [nil, '', '   '] (all values are nil or empty or blank)" do
          it "is invalid" do
            test.values = [nil, "", "   "]
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['1', nil, nil, nil, nil] (1 valid value)" do
          it "is valid" do
            test.values = ["1", nil, nil, nil, nil]
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', nil, nil, nil] (2 valid values)" do
          it "is valid" do
            test.values = ["1", "2", nil, nil, nil]
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', '3', nil, nil] (3 valid values)" do
          it "is valid" do
            test.values = ["1", "2", "3", nil, nil]
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', '3', '4', nil] (4 valid values)" do
          it "is invalid" do
            test.values = ["1", "2", "3", "4", nil]
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['1', '2', '3', '4', '5'] (all valid values)" do
          it "is invalid" do
            test.values = ["1", "2", "3", "4", "5"]
            expect(test.valid?).to eq false
          end
        end
      end# }}}

      context "when apply to Hash" do# {{{
        context "when apply to {} (empty)" do
          it "is valid" do
            test.values = {}
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => nil, :b => nil, :c => nil, :d => nil :e => nil } (all values are nil or empty or blank)" do
          it "is invalid" do
            test.values = { :a => nil, :b => "", :c => "   " }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => nil, :c => nil, :d => nil :e => nil } (1 valid value)" do
          it "is valid" do
            test.values = { :a => "1", :b => nil, :c => nil, :d => nil, :e => nil }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => nil, :d => nil :e => nil } (2 valid values)" do
          it "is valid" do
            test.values = { :a => "1", :b => "2", :c => nil, :d => nil, :e => nil }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '3', :d => nil, :e => nil } (3 valid values)" do
          it "is valid" do
            test.values = { :a => "1", :b => "2", :c => "3", :d => nil, :e => nil }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '3', :d => '4', :e => nil } (4 valid values)" do
          it "is invalid" do
            test.values = { :a => "1", :b => "2", :c => "3", :d => "4", :e => nil }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '3', :d => '4', :e => '5' } (all valid values)" do
          it "is invalid" do
            test.values = { :a => "1", :b => "2", :c => "3", :d => "4", :e => "5" }
            expect(test.valid?).to eq false
          end
        end
      end# }}}
    end# }}}

    context "when given :min_valid_count and :max_valid_count option" do# {{{
      let(:test) { AnyPresenceTestWithBothValidCount.new }

      context "when apply to nil" do
        it "is valid" do
          test.values = nil
          expect(test.valid?).to eq true
        end
      end

      context "when apply to Array" do# {{{
        context "when apply to [] (empty)" do
          it "is valid" do
            test.values = []
            expect(test.valid?).to eq true
          end
        end
        context "when apply to [nil, '', '   '] (all values are nil or empty or blank)" do
          it "is invalid" do
            test.values = [nil, "", "   "]
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['1', nil, nil, nil, nil] (1 valid value)" do
          it "is invalid" do
            test.values = ["1", nil, nil, nil, nil]
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['1', '2', nil, nil, nil] (2 valid values)" do
          it "is valid" do
            test.values = ["1", "2", nil, nil, nil]
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', '3', nil, nil] (3 valid values)" do
          it "is valid" do
            test.values = ["1", "2", "3", nil, nil]
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', '3', '4', nil] (4 valid values)" do
          it "is invalid" do
            test.values = ["1", "2", "3", "4", nil]
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['1', '2', '3', '4', '5'] (all valid values)" do
          it "is invalid" do
            test.values = ["1", "2", "3", "4", "5"]
            expect(test.valid?).to eq false
          end
        end
      end# }}}

      context "when apply to Hash" do# {{{
        context "when apply to {} (empty)" do
          it "is valid" do
            test.values = {}
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => nil, :b => nil, :c => nil, :d => nil :e => nil } (all values are nil or empty or blank)" do
          it "is invalid" do
            test.values = { :a => nil, :b => "", :c => "   " }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => nil, :c => nil, :d => nil :e => nil } (1 valid value)" do
          it "is invalid" do
            test.values = { :a => "1", :b => nil, :c => nil, :d => nil, :e => nil }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => nil, :d => nil :e => nil } (2 valid values)" do
          it "is valid" do
            test.values = { :a => "1", :b => "2", :c => nil, :d => nil, :e => nil }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '3', :d => nil, :e => nil } (3 valid values)" do
          it "is valid" do
            test.values = { :a => "1", :b => "2", :c => "3", :d => nil, :e => nil }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '3', :d => '4', :e => nil } (4 valid values)" do
          it "is invalid" do
            test.values = { :a => "1", :b => "2", :c => "3", :d => "4", :e => nil }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '3', :d => '4', :e => '5' } (all valid values)" do
          it "is invalid" do
            test.values = { :a => "1", :b => "2", :c => "3", :d => "4", :e => "5" }
            expect(test.valid?).to eq false
          end
        end
      end# }}}
    end# }}}
  end

  describe "error message" do
    context "when given no option" do# {{{
      let(:test) { AnyPresenceTest.new }

      context "when valid" do
        before do
          test.values = ['1', '2', nil]
          test.valid?
        end

        it "has no message" do
          expect(test.errors.present?).to eq false
        end
      end
      context "when invalid" do
        before do
          test.values = [nil, "", "   "]
          test.valid?
        end

        it "has 1 error message" do
          expect(test.errors.empty?).to eq false
          expect(test.errors.size).to eq 1
        end
        it "error message is associated with values attribute" do
          expect(test.errors.include?(:values)).to eq true
        end
        it %q{error messsage is "Values must contain not blank value (required number is 1-)"} do
          expect(test.errors.full_messages.first).to eq "Values must contain not blank value (required number is 1-)"
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          test.values = [nil, "", "   "]
          test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is translated" do
          expect(test.errors.full_messages.first).to eq "Values には空でない値が必要数(1～)含まれている必要があります"
        end
      end
    end# }}}

    context "when given :min_valid_count option" do# {{{
      let(:test) { AnyPresenceTestWithMinValidCountOnly.new }

      context "when invalid" do
        before do
          test.values = ["1", "", "   "]
          test.valid?
        end

        it "has 1 error message" do
          expect(test.errors.empty?).to eq false
          expect(test.errors.size).to eq 1
        end
        it "error message is associated with values attribute" do
          expect(test.errors.include?(:values)).to eq true
        end
        it %q{error messsage is "Values must contain not blank value (required number is 2-)"} do
          expect(test.errors.full_messages.first).to eq "Values must contain not blank value (required number is 2-)"
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          test.values = ["1", "", "   "]
          test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is translated" do
          expect(test.errors.full_messages.first).to eq "Values には空でない値が必要数(2～)含まれている必要があります"
        end
      end
    end# }}}

    context "when given :max_valid_count option" do# {{{
      let(:test) { AnyPresenceTestWithMaxValidCountOnly.new }

      context "when invalid" do
        before do
          test.values = ["1", "2", "3", "4", nil]
          test.valid?
        end

        it "has 1 error message" do
          expect(test.errors.empty?).to eq false
          expect(test.errors.size).to eq 1
        end
        it "error message is associated with values attribute" do
          expect(test.errors.include?(:values)).to eq true
        end
        it %q{error messsage is "Values must contain not blank value (required number is 1-3)"} do
          expect(test.errors.full_messages.first).to eq "Values must contain not blank value (required number is 1-3)"
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          test.values = ["1", "2", "3", "4", nil]
          test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is translated" do
          expect(test.errors.full_messages.first).to eq "Values には空でない値が必要数(1～3)含まれている必要があります"
        end
      end
    end# }}}

    context "when given :min_valid_count and :max_valid_count option" do# {{{
      let(:test) { AnyPresenceTestWithBothValidCount.new }

      context "when invalid" do
        before do
          test.values = ["1", "2", "3", "4", nil]
          test.valid?
        end

        it "has 1 error message" do
          expect(test.errors.empty?).to eq false
          expect(test.errors.size).to eq 1
        end
        it "error message is associated with values attribute" do
          expect(test.errors.include?(:values)).to eq true
        end
        it %q{error messsage is "Values must contain not blank value (required number is 2-3)"} do
          expect(test.errors.full_messages.first).to eq "Values must contain not blank value (required number is 2-3)"
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          test.values = ["1", "2", "3", "4", nil]
          test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is translated" do
          expect(test.errors.full_messages.first).to eq "Values には空でない値が必要数(2～3)含まれている必要があります"
        end
      end
    end# }}}

    context "when given message option" do# {{{
      let(:test) { AnyPresenceTestWithMessageOption.new }

      context "when invalid" do
        before do
          test.values = [nil, "", "   "]
          test.valid?
        end
        it "error messsage uses given message" do
          expect(test.errors.full_messages.first).to eq 'Values is invalid'
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          test.values = [nil, "", "   "]
          test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is not translated" do
          expect(test.errors.full_messages.first).to eq 'Values is invalid'
        end
      end
    end# }}}
  end
end
