# coding: utf-8
require "spec_helper"
require "active_support/i18n"
require "test_class/any_inclusion_test"

describe Detox::Validations::AnyInclusionValidator do
  describe "validation result" do
    context "when given no additional option" do# {{{
      let(:test) { AnyInclusionTest.new }

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
        context "when apply to ['1', 'a', 'a', 'a', 'a'] (1 valid value)" do
          it "is valid" do
            test.values = ['1', 'a', 'a', 'a', 'a']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', 'a', 'a', 'a'] (2 valid values)" do
          it "is valid" do
            test.values = ['1', '2', 'a', 'a', 'a']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', '3', 'a', 'a'] (3 valid values)" do
          it "is valid" do
            test.values = ['1', '2', '3', 'a', 'a']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', '3', '1', 'a'] (4 valid values)" do
          it "is valid" do
            test.values = ['1', '2', '3', '1', 'a']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', '3', '1', '2'] (all valid values)" do
          it "is valid" do
            test.values = ['1', '2', '3', '1', '2']
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
          it "is invalid" do
            test.values = { :a => nil, :b => "", :c => "   " }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => 'a', :c => 'a', :d => 'a' :e => 'a' } (1 valid value)" do
          it "is valid" do
            test.values = { :a => '1', :b => 'a', :c => 'a', :d => 'a', :e => 'a' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => 'a', :d => 'a' :e => 'a' } (2 valid values)" do
          it "is valid" do
            test.values = { :a => '1', :b => '2', :c => 'a', :d => 'a', :e => 'a' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '3', :d => 'a', :e => 'a' } (3 valid values)" do
          it "is valid" do
            test.values = { :a => '1', :b => '2', :c => '3', :d => 'a', :e => 'a' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '3', :d => '1', :e => 'a' } (4 valid values)" do
          it "is valid" do
            test.values = { :a => '1', :b => '2', :c => '3', :d => '1', :e => 'a' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '3', :d => '1', :e => '2' } (all valid values)" do
          it "is valid" do
            test.values = { :a => '1', :b => '2', :c => '3', :d => '1', :e => '2' }
            expect(test.valid?).to eq true
          end
        end
      end# }}}
    end# }}}

    context "when given only :min_valid_count option" do# {{{
      let(:test) { AnyInclusionTestWithMinValidCountOnly.new }

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
        context "when apply to ['1', 'a', 'a', 'a', 'a'] (1 valid value)" do
          it "is invalid" do
            test.values = ['1', 'a', 'a', 'a', 'a']
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['1', '2', 'a', 'a', 'a'] (2 valid values)" do
          it "is valid" do
            test.values = ['1', '2', 'a', 'a', 'a']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', '3', 'a', 'a'] (3 valid values)" do
          it "is valid" do
            test.values = ['1', '2', '3', 'a', 'a']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', '3', '1', 'a'] (4 valid values)" do
          it "is valid" do
            test.values = ['1', '2', '3', '1', 'a']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', '3', '1', '2'] (all valid values)" do
          it "is valid" do
            test.values = ['1', '2', '3', '1', '2']
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
          it "is invalid" do
            test.values = { :a => nil, :b => "", :c => "   " }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => 'a', :c => 'a', :d => 'a' :e => 'a' } (1 valid value)" do
          it "is invalid" do
            test.values = { :a => '1', :b => 'a', :c => 'a', :d => 'a', :e => 'a' }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => 'a', :d => 'a' :e => 'a' } (2 valid values)" do
          it "is valid" do
            test.values = { :a => '1', :b => '2', :c => 'a', :d => 'a', :e => 'a' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '3', :d => 'a', :e => 'a' } (3 valid values)" do
          it "is valid" do
            test.values = { :a => '1', :b => '2', :c => '3', :d => 'a', :e => 'a' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '3', :d => '1', :e => 'a' } (4 valid values)" do
          it "is valid" do
            test.values = { :a => '1', :b => '2', :c => '3', :d => '1', :e => 'a' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '3', :d => '1', :e => '2' } (all valid values)" do
          it "is valid" do
            test.values = { :a => '1', :b => '2', :c => '3', :d => '1', :e => '2' }
            expect(test.valid?).to eq true
          end
        end
      end# }}}
    end# }}}

    context "when given only :max_valid_count option" do# {{{
      let(:test) { AnyInclusionTestWithMaxValidCountOnly.new }

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
        context "when apply to ['1', 'a', 'a', 'a', 'a'] (1 valid value)" do
          it "is valid" do
            test.values = ['1', 'a', 'a', 'a', 'a']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', 'a', 'a', 'a'] (2 valid values)" do
          it "is valid" do
            test.values = ['1', '2', 'a', 'a', 'a']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', '3', 'a', 'a'] (3 valid values)" do
          it "is valid" do
            test.values = ['1', '2', '3', 'a', 'a']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', '3', '1', 'a'] (4 valid values)" do
          it "is invalid" do
            test.values = ['1', '2', '3', '1', 'a']
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['1', '2', '3', '1', '2'] (all valid values)" do
          it "is invalid" do
            test.values = ['1', '2', '3', '1', '2']
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
          it "is invalid" do
            test.values = { :a => nil, :b => "", :c => "   " }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => 'a', :c => 'a', :d => 'a' :e => 'a' } (1 valid value)" do
          it "is valid" do
            test.values = { :a => '1', :b => 'a', :c => 'a', :d => 'a', :e => 'a' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => 'a', :d => 'a' :e => 'a' } (2 valid values)" do
          it "is valid" do
            test.values = { :a => '1', :b => '2', :c => 'a', :d => 'a', :e => 'a' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '3', :d => 'a', :e => 'a' } (3 valid values)" do
          it "is valid" do
            test.values = { :a => '1', :b => '2', :c => '3', :d => 'a', :e => 'a' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '3', :d => '1', :e => 'a' } (4 valid values)" do
          it "is invalid" do
            test.values = { :a => '1', :b => '2', :c => '3', :d => '1', :e => 'a' }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '3', :d => '1', :e => '2' } (all valid values)" do
          it "is invalid" do
            test.values = { :a => '1', :b => '2', :c => '3', :d => '1', :e => '2' }
            expect(test.valid?).to eq false
          end
        end
      end# }}}
    end# }}}

    context "when given :min_valid_count and :max_valid_count option" do# {{{
      let(:test) { AnyInclusionTestWithBothValidCount.new }

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
        context "when apply to ['1', 'a', 'a', 'a', 'a'] (1 valid value)" do
          it "is invalid" do
            test.values = ['1', 'a', 'a', 'a', 'a']
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['1', '2', 'a', 'a', 'a'] (2 valid values)" do
          it "is valid" do
            test.values = ['1', '2', 'a', 'a', 'a']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', '3', 'a', 'a'] (3 valid values)" do
          it "is valid" do
            test.values = ['1', '2', '3', 'a', 'a']
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['1', '2', '3', '1', 'a'] (4 valid values)" do
          it "is invalid" do
            test.values = ['1', '2', '3', '1', 'a']
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['1', '2', '3', '1', '2'] (all valid values)" do
          it "is invalid" do
            test.values = ['1', '2', '3', '1', '2']
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
          it "is invalid" do
            test.values = { :a => nil, :b => "", :c => "   " }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => 'a', :c => 'a', :d => 'a' :e => 'a' } (1 valid value)" do
          it "is invalid" do
            test.values = { :a => '1', :b => 'a', :c => 'a', :d => 'a', :e => 'a' }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => 'a', :d => 'a' :e => 'a' } (2 valid values)" do
          it "is valid" do
            test.values = { :a => '1', :b => '2', :c => 'a', :d => 'a', :e => 'a' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '3', :d => 'a', :e => 'a' } (3 valid values)" do
          it "is valid" do
            test.values = { :a => '1', :b => '2', :c => '3', :d => 'a', :e => 'a' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '3', :d => '1', :e => 'a' } (4 valid values)" do
          it "is invalid" do
            test.values = { :a => '1', :b => '2', :c => '3', :d => '1', :e => 'a' }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '1', :b => '2', :c => '3', :d => '1', :e => '2' } (all valid values)" do
          it "is invalid" do
            test.values = { :a => '1', :b => '2', :c => '3', :d => '1', :e => '2' }
            expect(test.valid?).to eq false
          end
        end
      end# }}}
    end# }}}
  end

  describe "error message" do
    context "when given no option" do# {{{
      let(:test) { AnyInclusionTest.new }

      context "when valid" do
        before do
          test.values = ['1', '2', 'a']
          test.valid?
        end

        it "has no message" do
          expect(test.errors.present?).to eq false
        end
      end
      context "when invalid" do
        before do
          test.values = ['a', "", "   "]
          test.valid?
        end

        it "has 1 error message" do
          expect(test.errors.empty?).to eq false
          expect(test.errors.size).to eq 1
        end
        it "error message is associated with values attribute" do
          expect(test.errors.include?(:values)).to eq true
        end
        it %q{error messsage is "Values must be included in the list (required number is 1-)"} do
          expect(test.errors.full_messages.first).to eq "Values must be included in the list (required number is 1-)"
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          test.values = ['a', "", "   "]
          test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is translated" do
          expect(test.errors.full_messages.first).to eq "Values は必要数(1～)がリストに含まれていなければなりません"
        end
      end
    end# }}}

    context "when given :min_valid_count option" do# {{{
      let(:test) { AnyInclusionTestWithMinValidCountOnly.new }

      context "when invalid" do
        before do
          test.values = ['1', "", "   "]
          test.valid?
        end

        it "has 1 error message" do
          expect(test.errors.empty?).to eq false
          expect(test.errors.size).to eq 1
        end
        it "error message is associated with values attribute" do
          expect(test.errors.include?(:values)).to eq true
        end
        it %q{error messsage is "Values must be included in the list (required number is 2-)"} do
          expect(test.errors.full_messages.first).to eq "Values must be included in the list (required number is 2-)"
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          test.values = ['a', "", "   "]
          test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is translated" do
          expect(test.errors.full_messages.first).to eq "Values は必要数(2～)がリストに含まれていなければなりません"
        end
      end
    end# }}}

    context "when given :max_valid_count option" do# {{{
      let(:test) { AnyInclusionTestWithMaxValidCountOnly.new }

      context "when invalid" do
        before do
          test.values = ['1', '2', '3', '1', 'a']
          test.valid?
        end

        it "has 1 error message" do
          expect(test.errors.empty?).to eq false
          expect(test.errors.size).to eq 1
        end
        it "error message is associated with values attribute" do
          expect(test.errors.include?(:values)).to eq true
        end
        it %q{error messsage is "Values must be included in the list (required number is 1-3)"} do
          expect(test.errors.full_messages.first).to eq "Values must be included in the list (required number is 1-3)"
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          test.values = ['1', '2', '3', '1', 'a']
          test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is translated" do
          expect(test.errors.full_messages.first).to eq "Values は必要数(1～3)がリストに含まれていなければなりません"
        end
      end
    end# }}}

    context "when given :min_valid_count and :max_valid_count option" do# {{{
      let(:test) { AnyInclusionTestWithBothValidCount.new }

      context "when invalid" do
        before do
          test.values = ['1', '2', '3', '1', 'a']
          test.valid?
        end

        it "has 1 error message" do
          expect(test.errors.empty?).to eq false
          expect(test.errors.size).to eq 1
        end
        it "error message is associated with values attribute" do
          expect(test.errors.include?(:values)).to eq true
        end
        it %q{error messsage is "Values must be included in the list (required number is 2-3)"} do
          expect(test.errors.full_messages.first).to eq "Values must be included in the list (required number is 2-3)"
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          test.values = ['1', '2', '3', '1', 'a']
          test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is translated" do
          expect(test.errors.full_messages.first).to eq "Values は必要数(2～3)がリストに含まれていなければなりません"
        end
      end
    end# }}}

    context "when given message option" do# {{{
      let(:test) { AnyInclusionTestWithMessageOption.new }

      context "when invalid" do
        before do
          test.values = ['a', "", "   "]
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
          test.values = ['a', "", "   "]
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

