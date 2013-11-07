# coding: utf-8
require "spec_helper"
require "active_support/i18n"
require "test_class/all_numericality_test"

describe Detox::Validations::AllNumericalityValidator do
  describe "validation result " do
    context "when given no additional option" do# {{{
      let(:test) { AllNumericalityTest.new }

      context "when apply to nil" do
        it "is valid" do
          test.prices = nil
          expect(test.valid?).to eq true
        end
      end

      context "when apply to Array" do# {{{
        context "when apply to [] (empty)" do
          it "is valid" do
            test.prices = []
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['0', '1.5', '-1'] (valid values)" do
          it "is valid" do
            test.prices = ["0", "1.5", "-1"]
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['0', '1.5', '-1', 'a'] (contains invalid value)" do
          it "is invalid" do
            test.prices = ["0", "1.5", "-1", "a"]
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['0', '1.5', '-1', nil] (contains nil)" do
          it "is invalid" do
            test.prices = ["0", "1.5", "-1", nil]
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['0', '1.5', '-1', ''] (contains empty)" do
          it "is invalid" do
            test.prices = ["0", "1.5", "-1", ""]
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['0', '1.5', '-1', '   '] (contains blank)" do
          it "is invalid" do
            test.prices = ["0", "1.5", "-1", "   "]
            expect(test.valid?).to eq false
          end
        end
      end# }}}

      context "when apply to Hash" do# {{{
        context "when apply to {} (empty)" do
          it "is valid" do
            test.prices = {}
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '0', :b => '1.5', :c => '-1' } (valid values)" do
          it "is valid" do
            test.prices = { :a => '0', :b => '1.5', :c => '-1' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '0', :b => '1.5', :c => '-1', :d => 'a' } (contains invalid word)" do
          it "is invalid" do
            test.prices = { :a => '0', :b => '1.5', :c => '-1', :d => 'a' }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '0', :b => '1.5', :c => '-1', :d => nil } (contains nil)" do
          it "is invalid" do
            test.prices = { :a => '0', :b => '1.5', :c => '-1', :d => nil }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '0', :b => '1.5', :c => '-1', :d => '' } (contains empty)" do
          it "is invalid" do
            test.prices = { :a => '0', :b => '1.5', :c => '-1', :d => '' }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '0', :b => '1.5', :c => '-1', :d => '   ' } (contains blank)" do
          it "is invalid" do
            test.prices = { :a => '0', :b => '1.5', :c => '-1', :d => '   ' }
            expect(test.valid?).to eq false
          end
        end
      end# }}}
    end# }}}

    context "when given ignore_nil_value option" do# {{{
      let(:test) { AllNumericalityTestWithIgnoreNilValueOption.new }

      context "when apply to nil" do
        it "is valid" do
          test.prices = nil
          expect(test.valid?).to eq true
        end
      end

      context "when apply to Array" do# {{{
        context "when apply to [] (empty)" do
          it "is valid" do
            test.prices = []
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['0', '1.5', '-1'] (valid values)" do
          it "is valid" do
            test.prices = ["0", "1.5", "-1"]
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['0', '1.5', '-1', 'a'] (contains invalid value)" do
          it "is invalid" do
            test.prices = ["0", "1.5", "-1", "a"]
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['0', '1.5', '-1', nil] (contains nil)" do
          it "is valid" do
            test.prices = ["0", "1.5", "-1", nil]
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['0', '1.5', '-1', ''] (contains empty)" do
          it "is invalid" do
            test.prices = ["0", "1.5", "-1", ""]
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['0', '1.5', '-1', '   '] (contains blank)" do
          it "is invalid" do
            test.prices = ["0", "1.5", "-1", "   "]
            expect(test.valid?).to eq false
          end
        end
      end# }}}

      context "when apply to Hash" do# {{{
        context "when apply to {} (empty)" do
          it "is valid" do
            test.prices = {}
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '0', :b => '1.5', :c => '-1' } (valid values)" do
          it "is valid" do
            test.prices = { :a => '0', :b => '1.5', :c => '-1' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '0', :b => '1.5', :c => '-1', :d => 'a' } (contains invalid word)" do
          it "is invalid" do
            test.prices = { :a => '0', :b => '1.5', :c => '-1', :d => 'a' }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '0', :b => '1.5', :c => '-1', :d => nil } (contains nil)" do
          it "is valid" do
            test.prices = { :a => '0', :b => '1.5', :c => '-1', :d => nil }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '0', :b => '1.5', :c => '-1', :d => '' } (contains empty)" do
          it "is invalid" do
            test.prices = { :a => '0', :b => '1.5', :c => '-1', :d => '' }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '0', :b => '1.5', :c => '-1', :d => '   ' } (contains blank)" do
          it "is invalid" do
            test.prices = { :a => '0', :b => '1.5', :c => '-1', :d => '   ' }
            expect(test.valid?).to eq false
          end
        end
      end# }}}
    end# }}}

    context "when given ignore_blank_value option" do# {{{
      let(:test) { AllNumericalityTestWithIgnoreBlankValueOption.new }

      context "when apply to nil" do
        it "is valid" do
          test.prices = nil
          expect(test.valid?).to eq true
        end
      end

      context "when apply to Array" do# {{{
        context "when apply to [] (empty)" do
          it "is valid" do
            test.prices = []
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['0', '1.5', '-1'] (valid values)" do
          it "is valid" do
            test.prices = ["0", "1.5", "-1"]
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['0', '1.5', '-1', 'a'] (contains invalid value)" do
          it "is invalid" do
            test.prices = ["0", "1.5", "-1", "a"]
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['0', '1.5', '-1', nil] (contains nil)" do
          it "is valid" do
            test.prices = ["0", "1.5", "-1", nil]
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['0', '1.5', '-1', ''] (contains empty)" do
          it "is valid" do
            test.prices = ["0", "1.5", "-1", ""]
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['0', '1.5', '-1', '   '] (contains blank)" do
          it "is valid" do
            test.prices = ["0", "1.5", "-1", "   "]
            expect(test.valid?).to eq true
          end
        end
      end# }}}

      context "when apply to Hash" do# {{{
        context "when apply to {} (empty)" do
          it "is valid" do
            test.prices = {}
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '0', :b => '1.5', :c => '-1' } (valid values)" do
          it "is valid" do
            test.prices = { :a => '0', :b => '1.5', :c => '-1' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '0', :b => '1.5', :c => '-1', :d => 'a' } (contains invalid word)" do
          it "is invalid" do
            test.prices = { :a => '0', :b => '1.5', :c => '-1', :d => 'a' }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '0', :b => '1.5', :c => '-1', :d => nil } (contains nil)" do
          it "is valid" do
            test.prices = { :a => '0', :b => '1.5', :c => '-1', :d => nil }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '0', :b => '1.5', :c => '-1', :d => '' } (contains empty)" do
          it "is valid" do
            test.prices = { :a => '0', :b => '1.5', :c => '-1', :d => '' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '0', :b => '1.5', :c => '-1', :d => '   ' } (contains blank)" do
          it "is valid" do
            test.prices = { :a => '0', :b => '1.5', :c => '-1', :d => '   ' }
            expect(test.valid?).to eq true
          end
        end
      end# }}}
    end# }}}

    context "when given original option (only_integer)" do# {{{
      let(:test) { AllNumericalityTestWithOriginalOption.new }

      context "when apply to ['0', '1', '-1'] (integer values)" do
        it "is valid" do
          test.prices = ["0", "1", "-1"]
          expect(test.valid?).to eq true
        end
      end
      context "when apply to ['0', '1.5', '-1'] (contain decimal values)" do
        it "is invalid" do
          test.prices = ["0", "1.5", "-1"]
          expect(test.valid?).to eq false
        end
      end
    end# }}}
  end

  describe "error message" do
    context "when witout message option" do# {{{
      let(:test) { AllNumericalityTest.new }

      context "when valid" do
        before do
          test.prices = ['0', '1.5', '-1']
          test.valid?
        end

        it "has no message" do
          expect(test.errors.present?).to eq false
        end
      end
      context "when invalid" do
        before do
          test.prices = ['0', '1.5', '-1', 'a']
          test.valid?
        end

        it "has 1 error message" do
          expect(test.errors.empty?).to eq false
          expect(test.errors.size).to eq 1
        end
        it "error message is associated with prices attribute" do
          expect(test.errors.include?(:prices)).to eq true
        end
        it "error messsage is 'Prices contains not numeric value'" do
          expect(test.errors.full_messages.first).to eq "Prices contains not numeric value"
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          test.prices = ['0', '1.5', '-1', 'a']
          test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is translated" do
          expect(test.errors.full_messages.first).to eq "Prices は数値でない値を含んでいます"
        end
      end
    end# }}}

    context "when given message option" do# {{{
      let(:test) { AllNumericalityTestWithMessageOption.new }

      context "when invalid" do
        before do
          test.prices = ['0', '1.5', '-1', 'a']
          test.valid?
        end
        it "error messsage uses given message" do
          expect(test.errors.full_messages.first).to eq 'Prices is invalid'
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          test.prices = ['0', '1.5', '-1', 'a']
          test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is not translated" do
          expect(test.errors.full_messages.first).to eq 'Prices is invalid'
        end
      end
    end# }}}
  end
end

