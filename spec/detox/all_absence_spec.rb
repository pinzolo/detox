# coding: utf-8
require "spec_helper"
require "active_support/i18n"
require "test_class/all_absence_test"

describe Detox::AllAbsenceValidator do
  describe "validation result" do
    before do
      @test = AllAbsenceTest.new
    end

    context "when apply to nil" do
      it "is valid" do
        @test.values = nil
        expect(@test.valid?).to eq true
      end
    end

    context "when apply to Array" do
      context "when apply to [] (empty)" do
        it "is valid" do
          @test.values = []
          expect(@test.valid?).to eq true
        end
      end
      context "when apply to [nil, nil, nil] (only nil)" do
        it "is valid" do
          @test.values = [nil, nil, nil]
          expect(@test.valid?).to eq true
        end
      end
      context "when apply to [nil, '', '   '] (nil, empty, blank)" do
        it "is valid" do
          @test.values = [nil, "", "   "]
          expect(@test.valid?).to eq true
        end
      end
      context "when apply to [nil, '', '   ', '4'] (contains not blank value)" do
        it "is invalid" do
          @test.values = [nil, "", "   ", "4"]
          expect(@test.valid?).to eq false
        end
      end
    end

    context "when apply to Hash" do
      context "when apply to {} (empty)" do
        it "is valid" do
          @test.values = {}
          expect(@test.valid?).to eq true
        end
      end
      context "when apply to { :a => nil, :b => nil, :c => nil } (only nil)" do
        it "is valid" do
          @test.values = { :a => nil, :b => nil, :c => nil }
          expect(@test.valid?).to eq true
        end
      end
      context "when apply to { :a => nil, :b => '', :c => '   ' } (only nil)" do
        it "is valid" do
          @test.values = { :a => nil, :b => "", :c => "   " }
          expect(@test.valid?).to eq true
        end
      end
      context "when apply to { :a => nil, :b => '', :c => '   ', :d => '4' } (contains not blank value)" do
        it "is invalid" do
          @test.values = { :a => nil, :b => "", :c => "   ", :d => "4"}
          expect(@test.valid?).to eq false
        end
      end
    end
  end

  describe "error message" do
    context "when without message option" do# {{{
      before do
        @test = AllAbsenceTest.new
      end

      context "when valid" do
        before do
          @test.values = [nil, "", "   "]
          @test.valid?
        end

        it "has no message" do
          expect(@test.errors.present?).to eq false
        end
      end
      context "when invalid" do
        before do
          @test.values = [nil, "", "1"]
          @test.valid?
        end

        it "has 1 error message" do
          expect(@test.errors.empty?).to eq false
          expect(@test.errors.size).to eq 1
        end
        it "error message is associated with values attribute" do
          expect(@test.errors.include?(:values)).to eq true
        end
        it %q{error messsage is "Values can't contain not blank value"} do
          expect(@test.errors.full_messages.first).to eq "Values can't contain not blank value"
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          @test.values = [nil, "", "1"]
          @test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is translated" do
          expect(@test.errors.full_messages.first).to eq "Values には空ではない値を含められません"
        end
      end
    end# }}}

    context "when given message option" do# {{{
      before do
        @test = AllAbsenceTestWithMessageOption.new
      end
      context "when invalid" do
        before do
          @test.values = [nil, "", "1"]
          @test.valid?
        end
        it "error messsage uses given message" do
          expect(@test.errors.full_messages.first).to eq 'Values is invalid'
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          @test.values = [nil, "", "1"]
          @test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is not translated" do
          expect(@test.errors.full_messages.first).to eq 'Values is invalid'
        end
      end
    end# }}}
  end
end
