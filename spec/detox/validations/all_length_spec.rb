# coding: utf-8
require "spec_helper"
require "active_support/i18n"
require "test_class/all_length_test"

describe Detox::Validations::AllLengthValidator do
  describe "validation result (3 <= length <= 6)" do
    context "when given no additional option" do# {{{
      let(:test) { AllLengthTest.new }

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
        context "when apply to ['12345', '123', '123456'] (valid values)" do
          it "is valid" do
            test.values = ["12345", "123", "123456"]
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['12345', '123', '1234567'] (contains longer value)" do
          it "is invalid" do
            test.values = ["12345", "123", "1234567"]
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['12345', '123', '123'] (contains shorter value)" do
          it "is invalid" do
            test.values = ["12345", "123", "12"]
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['12345', '123', nil] (contains nil)" do
          it "is invalid" do
            test.values = ["12345", "123", nil]
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['12345', '123', ''] (contains empty)" do
          it "is invalid" do
            test.values = ["12345", "123", ""]
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['12345', '123', '  '] (contains invalid length blank)" do
          it "is invalid" do
            test.values = ["12345", "123", "  "]
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
        context "when apply to { :a => '12345', :b => '123', :c => '123456' } (valid values)" do
          it "is valid" do
            test.values = { :a => '12345', :b => '123', :c => '123456' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '12345', :b => '123', :c => '1234567' } (contains longer value)" do
          it "is invalid" do
            test.values = { :a => '12345', :b => '123', :c => '1234567' }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '12345', :b => '123', :c => '12' } (contains shorter value)" do
          it "is invalid" do
            test.values = { :a => '12345', :b => '123', :c => '12' }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '12345', :b => '123', :c => nil } (contains nil)" do
          it "is invalid" do
            test.values = { :a => '12345', :b => '123', :c => nil }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '12345', :b => '123', :c => '' } (contains empty)" do
          it "is invalid" do
            test.values = { :a => '12345', :b => '123', :c => '' }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '12345', :b => '123', :c => '  ' } (contains invalid length blank)" do
          it "is invalid" do
            test.values = { :a => '12345', :b => '123', :c => '  ' }
            expect(test.valid?).to eq false
          end
        end
      end# }}}
    end# }}}

    context "when given ignore_nil_value option" do# {{{
      let(:test) { AllLengthTestWithIgnoreNilValueOption.new }

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
        context "when apply to ['12345', '123', '123456'] (valid values)" do
          it "is valid" do
            test.values = ["12345", "123", "123456"]
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['12345', '123', '1234567'] (contains longer value)" do
          it "is invalid" do
            test.values = ["12345", "123", "1234567"]
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['12345', '123', '12'] (contains shorter value)" do
          it "is invalid" do
            test.values = ["12345", "123", "12"]
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['12345', '123', nil] (contains nil)" do
          it "is valid" do
            test.values = ["12345", "123", nil]
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['12345', '123', ''] (contains empty)" do
          it "is invalid" do
            test.values = ["12345", "123", ""]
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['12345', '123', '  '] (contains invalid length blank)" do
          it "is invalid" do
            test.values = ["12345", "123", "  "]
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
        context "when apply to { :a => '12345', :b => '123', :c => '123456' } (valid values)" do
          it "is valid" do
            test.values = { :a => '12345', :b => '123', :c => '123456' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '12345', :b => '123', :c => '1234567' } (contains longer value)" do
          it "is invalid" do
            test.values = { :a => '12345', :b => '123', :c => '1234567' }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '12345', :b => '123', :c => '12' } (contains shorter value)" do
          it "is invalid" do
            test.values = { :a => '12345', :b => '123', :c => '12' }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '12345', :b => '123', :c => nil } (contains nil)" do
          it "is valid" do
            test.values = { :a => '12345', :b => '123', :c => nil }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '12345', :b => '123', :c => '' } (contains empty)" do
          it "is invalid" do
            test.values = { :a => '12345', :b => '123', :c => '' }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '12345', :b => '123', :c => '  ' } (contains invalid length blank)" do
          it "is invalid" do
            test.values = { :a => '12345', :b => '123', :c => '  ' }
            expect(test.valid?).to eq false
          end
        end
      end# }}}
    end# }}}

    context "when given ignore_blank_value option" do# {{{
      let(:test) { AllLengthTestWithIgnoreBlankValueOption.new }

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
        context "when apply to ['12345', '123', '123456'] (valid values)" do
          it "is valid" do
            test.values = ["12345", "123", "123456"]
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['12345', '123', '1234567'] (contains longer length)" do
          it "is invalid" do
            test.values = ["12345", "123", "1234567"]
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['12345', '123', '12'] (contains shorter length)" do
          it "is invalid" do
            test.values = ["12345", "123", "12"]
            expect(test.valid?).to eq false
          end
        end
        context "when apply to ['12345', '123', nil] (contains nil)" do
          it "is valid" do
            test.values = ["12345", "123", nil]
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['12345', '123', ''] (contains empty)" do
          it "is valid" do
            test.values = ["12345", "123", ""]
            expect(test.valid?).to eq true
          end
        end
        context "when apply to ['12345', '123', '  '] (contains invalid length blank)" do
          it "is valid" do
            test.values = ["12345", "123", "  "]
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
        context "when apply to { :a => '12345', :b => '123', :c => '123456' } (valid values)" do
          it "is valid" do
            test.values = { :a => '12345', :b => '123', :c => '123456' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '12345', :b => '123', :c => '1234567' } (contains longer value)" do
          it "is invalid" do
            test.values = { :a => '12345', :b => '123', :c => '1234567' }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '12345', :b => '123', :c => '12' } (contains shorter value)" do
          it "is invalid" do
            test.values = { :a => '12345', :b => '123', :c => '12' }
            expect(test.valid?).to eq false
          end
        end
        context "when apply to { :a => '12345', :b => '123', :c => nil } (contains nil)" do
          it "is valid" do
            test.values = { :a => '12345', :b => '123', :c => nil }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '12345', :b => '123', :c => '' } (contains empty)" do
          it "is valid" do
            test.values = { :a => '12345', :b => '123', :c => '' }
            expect(test.valid?).to eq true
          end
        end
        context "when apply to { :a => '12345', :b => '123', :c => '  ' } (contains invalid length blank)" do
          it "is valid" do
            test.values = { :a => '12345', :b => '123', :c => '  ' }
            expect(test.valid?).to eq true
          end
        end
      end# }}}
    end# }}}
  end

  describe "error message" do
    context "when witout message option" do# {{{
      let(:test) { AllLengthTest.new }

      context "when valid" do
        before do
          test.values = ['12345', '123', '123456']
          test.valid?
        end

        it "has no message" do
          expect(test.errors.present?).to eq false
        end
      end
      context "when invalid" do
        before do
          test.values = ['12345', '123', '1234567']
          test.valid?
        end

        it "has 1 error message" do
          expect(test.errors.empty?).to eq false
          expect(test.errors.size).to eq 1
        end
        it "error message is associated with values attribute" do
          expect(test.errors.include?(:values)).to eq true
        end
        it "error messsage is 'Values contains invalid length value'" do
          expect(test.errors.full_messages.first).to eq "Values contains invalid length value"
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          test.values = ['12345', '123', '1234567']
          test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is translated" do
          expect(test.errors.full_messages.first).to eq "Values には長さが不正な値が含まれています"
        end
      end
    end# }}}

    context "when given message option" do# {{{
      let(:test) { AllLengthTestWithMessageOption.new }

      context "when invalid" do
        before do
          test.values = ['12345', '123', '1234567']
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
          test.values = ['12345', '123', '1234567']
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

