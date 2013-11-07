# coding: utf-8
require "spec_helper"
require "active_support/i18n"
require "test_class/all_exclusion_test"

describe Detox::Validations::AllExclusionValidator do
  describe "validation result" do
    let(:test) { AllExclusionTest.new }

    context "when apply to nil" do
      it "is valid" do
        test.values = nil
        expect(test.valid?).to eq true
      end
    end

    context "when apply to Array" do
      context "when apply to [] (empty)" do
        it "is valid" do
          test.values = []
          expect(test.valid?).to eq true
        end
      end
      context "when apply to ['1', '2', '3'] (valid values)" do
        it "is valid" do
          test.values = ["1", "2", "3"]
          expect(test.valid?).to eq true
        end
      end
      context "when apply to ['1', '2', '4'] (contains invalid values)" do
        it "is invalid" do
          test.values = ["1", "2", "4"]
          expect(test.valid?).to eq false
        end
      end
    end

    context "when apply to Hash" do
      context "when apply to {} (empty)" do
        it "is valid" do
          test.values = {}
          expect(test.valid?).to eq true
        end
      end
      context "when apply to { :a => '1', :b => '2', :c => '3' } (valid values)" do
        it "is valid" do
          test.values = { :a => '1', :b => '2', :c => '3' }
          expect(test.valid?).to eq true
        end
      end
      context "when apply to { :a => '1', :b => '2', :c => '4' } (contains invalid values)" do
        it "is invalid" do
          test.values = { :a => '1', :b => '2', :c => '4' }
          expect(test.valid?).to eq false
        end
      end
    end
  end

  describe "error message" do
    context "when without message option" do
      let(:test) { AllExclusionTest.new }

      context "when valid" do
        before do
          test.values = ['1', '2', '3']
          test.valid?
        end

        it "has no message" do
          expect(test.errors.present?).to eq false
        end
      end
      context "when invalid" do
        before do
          test.values = ['1', '2', '4']
          test.valid?
        end

        it "has 1 error message" do
          expect(test.errors.empty?).to eq false
          expect(test.errors.size).to eq 1
        end
        it "error message is associated with values attribute" do
          expect(test.errors.include?(:values)).to eq true
        end
        it %q{error messsage is "Values contains value that is included in the list"} do
          expect(test.errors.full_messages.first).to eq "Values contains value that is included in the list"
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          test.values = ['1', '2', '4']
          test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is translated" do
          expect(test.errors.full_messages.first).to eq "Values にはリストに含まれている値が含まれています"
        end
      end
    end

    context "when given message option" do
      let(:test) { AllExclusionTestWithMessageOption.new }

      context "when invalid" do
        before do
          test.values = ['1', '2', '4']
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
          test.values = ['1', '2', '4']
          test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is not translated" do
          expect(test.errors.full_messages.first).to eq 'Values is invalid'
        end
      end
    end
  end
end


