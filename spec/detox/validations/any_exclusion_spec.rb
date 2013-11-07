# coding: utf-8
require "spec_helper"
require "active_support/i18n"
require "test_class/any_exclusion_test"

describe Detox::Validations::AnyExclusionValidator do
  describe "validation result" do
    context "when given no additional option" do# {{{
      let(:test) { AnyExclusionTest.new }

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
          it "is valid" do
            test.values = [nil, "", "   "]
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '4', '4', '4', '4'] (1 valid value)" do
          it "is valid" do
            test.values = ['1', '4', '4', '4', '4']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '1', '4', '4', '4'] (2 valid values)" do
          it "is valid" do
            test.values = ['1', '1', '4', '4', '4']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '1', '1', '4', '4'] (3 valid values)" do
          it "is valid" do
            test.values = ['1', '1', '1', '4', '4']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '1', '1', '1', '4'] (4 valid values)" do
          it "is valid" do
            test.values = ['1', '1', '1', '1', '4']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '1', '1', '1', '1'] (all valid values)" do
          it "is valid" do
            test.values = ['1', '1', '1', '1', '1']
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
        context "when apply to { :a => nil, :b => '', :c => '   ' } (all values are nil or empty or blank)" do
          it "is valid" do
            test.values = { :a => nil, :b => "", :c => "   " }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '4', :c => '4', :d => '4' :e => '4' } (1 valid value)" do
          it "is valid" do
            test.values = { :a => '1', :b => '4', :c => '4', :d => '4', :e => '4' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => '4', :d => '4' :e => '4' } (2 valid values)" do
          it "is valid" do
            test.values = { :a => '1', :b => '1', :c => '4', :d => '4', :e => '4' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => '1', :d => '4', :e => '4' } (3 valid values)" do
          it "is valid" do
            test.values = { :a => '1', :b => '1', :c => '4', :d => '4', :e => '4' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => '1', :d => '1', :e => '4' } (4 valid values)" do
          it "is valid" do
            test.values = { :a => '1', :b => '1', :c => '1', :d => '4', :e => '4' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => '1', :d => '1', :e => '1' } (all valid values)" do
          it "is valid" do
            test.values = { :a => '1', :b => '1', :c => '1', :d => '1', :e => '1' }
            expect(test.valid?).to eq true
          end
        end
      end# }}}
    end# }}}

    context "when given only :min_valid_count option" do# {{{
      let(:test) { AnyExclusionTestWithMinValidCountOnly.new }

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
          it "is valid" do
            test.values = [nil, "", "   "]
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '4', '4', '4', '4'] (1 valid value)" do
          it "is invalid" do
            test.values = ['1', '4', '4', '4', '4']
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['1', '1', '4', '4', '4'] (2 valid values)" do
          it "is valid" do
            test.values = ['1', '1', '4', '4', '4']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '1', '1', '4', '4'] (3 valid values)" do
          it "is valid" do
            test.values = ['1', '1', '1', '4', '4']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '1', '1', '1', '4'] (4 valid values)" do
          it "is valid" do
            test.values = ['1', '1', '1', '1', '4']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '1', '1', '1', '1'] (all valid values)" do
          it "is valid" do
            test.values = ['1', '1', '1', '1', '1']
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
        context "when apply to { :a => nil, :b => '', :c => '   ' } (all values are nil or empty or blank)" do
          it "is valid" do
            test.values = { :a => nil, :b => "", :c => "   " }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '4', :c => '4', :d => '4' :e => '4' } (1 valid value)" do
          it "is invalid" do
            test.values = { :a => '1', :b => '4', :c => '4', :d => '4', :e => '4' }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => '4', :d => '4' :e => '4' } (2 valid values)" do
          it "is valid" do
            test.values = { :a => '1', :b => '1', :c => '4', :d => '4', :e => '4' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => '1', :d => '4', :e => '4' } (3 valid values)" do
          it "is valid" do
            test.values = { :a => '1', :b => '1', :c => '1', :d => '4', :e => '4' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => '1', :d => '1', :e => '4' } (4 valid values)" do
          it "is valid" do
            test.values = { :a => '1', :b => '1', :c => '1', :d => '1', :e => '4' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => '1', :d => '1', :e => '1' } (all valid values)" do
          it "is valid" do
            test.values = { :a => '1', :b => '1', :c => '1', :d => '1', :e => '1' }
            expect(test.valid?).to eq true
          end
        end
      end# }}}
    end# }}}

    context "when given only :max_valid_count option" do# {{{
      let(:test) { AnyExclusionTestWithMaxValidCountOnly.new }

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
          it "is valid" do
            test.values = [nil, "", "   "]
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '4', '4', '4', '4'] (1 valid value)" do
          it "is valid" do
            test.values = ['1', '4', '4', '4', '4']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '1', '4', '4', '4'] (2 valid values)" do
          it "is valid" do
            test.values = ['1', '1', '4', '4', '4']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '1', '1', '4', '4'] (3 valid values)" do
          it "is valid" do
            test.values = ['1', '1', '1', '4', '4']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '1', '1', '1', '4'] (4 valid values)" do
          it "is invalid" do
            test.values = ['1', '1', '1', '1', '4']
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['1', '1', '1', '1', '1'] (all valid values)" do
          it "is invalid" do
            test.values = ['1', '1', '1', '1', '1']
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
        context "when apply to { :a => nil, :b => '', :c => '   ' } (all values are nil or empty or blank)" do
          it "is valid" do
            test.values = { :a => nil, :b => "", :c => "   " }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '4', :c => '4', :d => '4' :e => '4' } (1 valid value)" do
          it "is valid" do
            test.values = { :a => '1', :b => '4', :c => '4', :d => '4', :e => '4' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => '4', :d => '4' :e => '4' } (2 valid values)" do
          it "is valid" do
            test.values = { :a => '1', :b => '1', :c => '4', :d => '4', :e => '4' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => '1', :d => '4', :e => '4' } (3 valid values)" do
          it "is valid" do
            test.values = { :a => '1', :b => '1', :c => '1', :d => '4', :e => '4' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => '1', :d => '1', :e => '4' } (4 valid values)" do
          it "is invalid" do
            test.values = { :a => '1', :b => '1', :c => '1', :d => '1', :e => '4' }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => '1', :d => '1', :e => '1' } (all valid values)" do
          it "is invalid" do
            test.values = { :a => '1', :b => '1', :c => '1', :d => '1', :e => '1' }
            expect(test.valid?).to eq false
          end
        end
      end# }}}
    end# }}}

    context "when given :min_valid_count and :max_valid_count option" do# {{{
      let(:test) { AnyExclusionTestWithBothValidCount.new }

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
          it "is valid" do
            test.values = [nil, "", "   "]
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '4', '4', '4', '4'] (1 valid value)" do
          it "is invalid" do
            test.values = ['1', '4', '4', '4', '4']
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['1', '1', '4', '4', '4'] (2 valid values)" do
          it "is valid" do
            test.values = ['1', '1', '4', '4', '4']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '1', '1', '4', '4'] (3 valid values)" do
          it "is valid" do
            test.values = ['1', '1', '1', '4', '4']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '1', '1', '1', '4'] (4 valid values)" do
          it "is invalid" do
            test.values = ['1', '1', '1', '1', '4']
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['1', '1', '1', '1', '1'] (all valid values)" do
          it "is invalid" do
            test.values = ['1', '1', '1', '1', '1']
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
        context "when apply to { :a => nil, :b => '', :c => '   ' } (all values are nil or empty or blank)" do
          it "is valid" do
            test.values = { :a => nil, :b => "", :c => "   " }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '4', :c => '4', :d => '4' :e => '4' } (1 valid value)" do
          it "is invalid" do
            test.values = { :a => '1', :b => '4', :c => '4', :d => '4', :e => '4' }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => '4', :d => '4' :e => '4' } (2 valid values)" do
          it "is valid" do
            test.values = { :a => '1', :b => '1', :c => '4', :d => '4', :e => '4' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => '1', :d => '4', :e => '4' } (3 valid values)" do
          it "is valid" do
            test.values = { :a => '1', :b => '1', :c => '1', :d => '4', :e => '4' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => '1', :d => '1', :e => '4' } (4 valid values)" do
          it "is invalid" do
            test.values = { :a => '1', :b => '1', :c => '1', :d => '1', :e => '4' }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => '1', :c => '1', :d => '1', :e => '1' } (all valid values)" do
          it "is invalid" do
            test.values = { :a => '1', :b => '1', :c => '1', :d => '1', :e => '1' }
            expect(test.valid?).to eq false
          end
        end
      end# }}}
    end# }}}
  end

  describe "error message" do
    context "when given no option" do# {{{
      let(:test) { AnyExclusionTest.new }

      context "when valid" do
        before do
          test.values = ['1', '1', '4']
          test.valid?
        end

        it "has no message" do
          expect(test.errors.present?).to eq false
        end
      end
      context "when invalid" do
        before do
          test.values = ['4', "5", "6"]
          test.valid?
        end

        it "has 1 error message" do
          expect(test.errors.empty?).to eq false
          expect(test.errors.size).to eq 1
        end
        it "error message is associated with values attribute" do
          expect(test.errors.include?(:values)).to eq true
        end
        it %q{error messsage is "Values must be not included in the list (required number is 1-)"} do
          expect(test.errors.full_messages.first).to eq "Values must be not included in the list (required number is 1-)"
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          test.values = ['4', "5", "6"]
          test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is translated" do
          expect(test.errors.full_messages.first).to eq "Values は必要数(1～)がリストに含まれていない値でなければなりません"
        end
      end
    end# }}}

    context "when given :min_valid_count option" do# {{{
      let(:test) { AnyExclusionTestWithMinValidCountOnly.new }

      context "when invalid" do
        before do
          test.values = ['1', "4", "4"]
          test.valid?
        end

        it "has 1 error message" do
          expect(test.errors.empty?).to eq false
          expect(test.errors.size).to eq 1
        end
        it "error message is associated with values attribute" do
          expect(test.errors.include?(:values)).to eq true
        end
        it %q{error messsage is "Values must be not included in the list (required number is 2-)"} do
          expect(test.errors.full_messages.first).to eq "Values must be not included in the list (required number is 2-)"
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          test.values = ['1', "4", "4"]
          test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is translated" do
          expect(test.errors.full_messages.first).to eq "Values は必要数(2～)がリストに含まれていない値でなければなりません"
        end
      end
    end# }}}

    context "when given :max_valid_count option" do# {{{
      let(:test) { AnyExclusionTestWithMaxValidCountOnly.new }

      context "when invalid" do
        before do
          test.values = ['1', '1', '1', '1', '4']
          test.valid?
        end

        it "has 1 error message" do
          expect(test.errors.empty?).to eq false
          expect(test.errors.size).to eq 1
        end
        it "error message is associated with values attribute" do
          expect(test.errors.include?(:values)).to eq true
        end
        it %q{error messsage is "Values must be not included in the list (required number is 1-3)"} do
          expect(test.errors.full_messages.first).to eq "Values must be not included in the list (required number is 1-3)"
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          test.values = ['1', '1', '1', '1', '4']
          test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is translated" do
          expect(test.errors.full_messages.first).to eq "Values は必要数(1～3)がリストに含まれていない値でなければなりません"
        end
      end
    end# }}}

    context "when given :min_valid_count and :max_valid_count option" do# {{{
      let(:test) { AnyExclusionTestWithBothValidCount.new }

      context "when invalid" do
        before do
          test.values = ['1', '1', '1', '1', '4']
          test.valid?
        end

        it "has 1 error message" do
          expect(test.errors.empty?).to eq false
          expect(test.errors.size).to eq 1
        end
        it "error message is associated with values attribute" do
          expect(test.errors.include?(:values)).to eq true
        end
        it %q{error messsage is "Values must be not included in the list (required number is 2-3)"} do
          expect(test.errors.full_messages.first).to eq "Values must be not included in the list (required number is 2-3)"
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          test.values = ['1', '1', '1', '1', '4']
          test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is translated" do
          expect(test.errors.full_messages.first).to eq "Values は必要数(2～3)がリストに含まれていない値でなければなりません"
        end
      end
    end# }}}

    context "when given message option" do# {{{
      let(:test) { AnyExclusionTestWithMessageOption.new }

      context "when invalid" do
        before do
          test.values = ['4', '4', '4']
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
          test.values = ['4', '4', '4']
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

