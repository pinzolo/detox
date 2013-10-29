# coding: utf-8
require "spec_helper"
require "active_support/i18n"
require "test_class/all_format_test"

describe Detox::Validations::AllFormatValidator do
  describe "validation result (pattern is /\\A\\w+\\z/)" do
    context "when given no additional option" do# {{{
      before do
        @test = AllFormatTest.new
      end

      context "when apply to nil" do
        it "is valid" do
          @test.words = nil
          expect(@test.valid?).to eq true
        end
      end

      context "when apply to Array" do# {{{
        context "when apply to [] (empty)" do
          it "is valid" do
            @test.words = []
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['foo', 'bar', 'baz'] (valid values)" do
          it "is valid" do
            @test.words = ["for", "bar", "baz"]
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['foo', 'bar', 'b@z'] (contains invalid word)" do
          it "is invalid" do
            @test.words = ["for", "bar", "b@z"]
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to ['foo', 'bar', nil] (contains nil)" do
          it "is invalid" do
            @test.words = ["for", "bar", nil]
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to ['foo', 'bar', ''] (contains empty)" do
          it "is invalid" do
            @test.words = ["for", "bar", ""]
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to ['foo', 'bar', '   '] (contains blank)" do
          it "is invalid" do
            @test.words = ["for", "bar", "   "]
            expect(@test.valid?).to eq false
          end
        end
      end# }}}

      context "when apply to Hash" do# {{{
        context "when apply to {} (empty)" do
          it "is valid" do
            @test.words = {}
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => 'foo', :b => 'bar', :c => 'baz' } (valid values)" do
          it "is valid" do
            @test.words = { :a => 'foo', :b => 'bar', :c => 'baz' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => 'foo', :b => 'bar', :c => 'b@z' } (contains invalid word)" do
          it "is invalid" do
            @test.words = { :a => 'foo', :b => 'bar', :c => 'b@z' }
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to { :a => 'foo', :b => 'bar', :c => nil } (contains nil)" do
          it "is invalid" do
            @test.words = { :a => 'foo', :b => 'bar', :c => nil }
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to { :a => 'foo', :b => 'bar', :c => '' } (contains empty)" do
          it "is invalid" do
            @test.words = { :a => 'foo', :b => 'bar', :c => '' }
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to { :a => 'foo', :b => 'bar', :c => '   ' } (contains blank)" do
          it "is invalid" do
            @test.words = { :a => 'foo', :b => 'bar', :c => '   ' }
            expect(@test.valid?).to eq false
          end
        end
      end# }}}
    end# }}}

    context "when given ignore_nil_value option" do# {{{
      before do
        @test = AllFormatTestWithIgnoreNilValueOption.new
      end

      context "when apply to nil" do
        it "is valid" do
          @test.words = nil
          expect(@test.valid?).to eq true
        end
      end

      context "when apply to Array" do# {{{
        context "when apply to [] (empty)" do
          it "is valid" do
            @test.words = []
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['foo', 'bar', 'baz'] (valid values)" do
          it "is valid" do
            @test.words = ["for", "bar", "baz"]
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['foo', 'bar', 'b@z'] (contains invalid word)" do
          it "is invalid" do
            @test.words = ["for", "bar", "b@z"]
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to ['foo', 'bar', nil] (contains nil)" do
          it "is valid" do
            @test.words = ["for", "bar", nil]
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['foo', 'bar', ''] (contains empty)" do
          it "is invalid" do
            @test.words = ["for", "bar", ""]
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to ['foo', 'bar', '   '] (contains blank)" do
          it "is invalid" do
            @test.words = ["for", "bar", "   "]
            expect(@test.valid?).to eq false
          end
        end
      end# }}}

      context "when apply to Hash" do# {{{
        context "when apply to {} (empty)" do
          it "is valid" do
            @test.words = {}
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => 'foo', :b => 'bar', :c => 'baz' } (valid values)" do
          it "is valid" do
            @test.words = { :a => 'foo', :b => 'bar', :c => 'baz' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => 'foo', :b => 'bar', :c => 'b@z' } (contains invalid word)" do
          it "is invalid" do
            @test.words = { :a => 'foo', :b => 'bar', :c => 'b@z' }
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to { :a => 'foo', :b => 'bar', :c => nil } (contains nil)" do
          it "is valid" do
            @test.words = { :a => 'foo', :b => 'bar', :c => nil }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => 'foo', :b => 'bar', :c => '' } (contains empty)" do
          it "is invalid" do
            @test.words = { :a => 'foo', :b => 'bar', :c => '' }
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to { :a => 'foo', :b => 'bar', :c => '   ' } (contains blank)" do
          it "is invalid" do
            @test.words = { :a => 'foo', :b => 'bar', :c => '   ' }
            expect(@test.valid?).to eq false
          end
        end
      end# }}}
    end# }}}

    context "when given ignore_blank_value option" do# {{{
      before do
        @test = AllFormatTestWithIgnoreBlankValueOption.new
      end

      context "when apply to nil" do
        it "is valid" do
          @test.words = nil
          expect(@test.valid?).to eq true
        end
      end

      context "when apply to Array" do# {{{
        context "when apply to [] (empty)" do
          it "is valid" do
            @test.words = []
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['foo', 'bar', 'baz'] (valid values)" do
          it "is valid" do
            @test.words = ["for", "bar", "baz"]
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['foo', 'bar', 'b@z'] (contains invalid word)" do
          it "is invalid" do
            @test.words = ["for", "bar", "b@z"]
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to ['foo', 'bar', nil] (contains nil)" do
          it "is valid" do
            @test.words = ["for", "bar", nil]
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['foo', 'bar', ''] (contains empty)" do
          it "is valid" do
            @test.words = ["for", "bar", ""]
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to ['foo', 'bar', '   '] (contains blank)" do
          it "is valid" do
            @test.words = ["for", "bar", "   "]
            expect(@test.valid?).to eq true
          end
        end
      end# }}}

      context "when apply to Hash" do# {{{
        context "when apply to {} (empty)" do
          it "is valid" do
            @test.words = {}
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => 'foo', :b => 'bar', :c => 'baz' } (valid values)" do
          it "is valid" do
            @test.words = { :a => 'foo', :b => 'bar', :c => 'baz' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => 'foo', :b => 'bar', :c => 'b@z' } (contains invalid word)" do
          it "is invalid" do
            @test.words = { :a => 'foo', :b => 'bar', :c => 'b@z' }
            expect(@test.valid?).to eq false
          end
        end
        context "when apply to { :a => 'foo', :b => 'bar', :c => nil } (contains nil)" do
          it "is valid" do
            @test.words = { :a => 'foo', :b => 'bar', :c => nil }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => 'foo', :b => 'bar', :c => '' } (contains empty)" do
          it "is valid" do
            @test.words = { :a => 'foo', :b => 'bar', :c => '' }
            expect(@test.valid?).to eq true
          end
        end
        context "when apply to { :a => 'foo', :b => 'bar', :c => '   ' } (contains blank)" do
          it "is valid" do
            @test.words = { :a => 'foo', :b => 'bar', :c => '   ' }
            expect(@test.valid?).to eq true
          end
        end
      end# }}}
    end# }}}
  end

  describe "error message" do
    context "when witout message option" do# {{{
      before do
        @test = AllFormatTest.new
      end

      context "when valid" do
        before do
          @test.words = ['foo', 'bar', 'baz']
          @test.valid?
        end

        it "has no message" do
          expect(@test.errors.present?).to eq false
        end
      end
      context "when invalid" do
        before do
          @test.words = ['foo', 'bar', 'b@z']
          @test.valid?
        end

        it "has 1 error message" do
          expect(@test.errors.empty?).to eq false
          expect(@test.errors.size).to eq 1
        end
        it "error message is associated with words attribute" do
          expect(@test.errors.include?(:words)).to eq true
        end
        it "error messsage is 'Words contains invalid format value'" do
          expect(@test.errors.full_messages.first).to eq "Words contains invalid format value"
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          @test.words = ['foo', 'bar', 'b@z']
          @test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is translated" do
          expect(@test.errors.full_messages.first).to eq "Words には不正な形式の値が含まれています"
        end
      end
    end# }}}

    context "when given message option" do# {{{
      before do
        @test = AllFormatTestWithMessageOption.new
      end
      context "when invalid" do
        before do
          @test.words = ['foo', 'bar', 'b@z']
          @test.valid?
        end
        it "error messsage uses given message" do
          expect(@test.errors.full_messages.first).to eq 'Words is invalid'
        end
      end
      context "when using i18n" do
        before do
          @base_locale = I18n.locale
          I18n.locale = :ja
          @test.words = ['foo', 'bar', 'b@z']
          @test.valid?
        end
        after do
          I18n.locale = @base_locale
        end
        it "error messsage is not translated" do
          expect(@test.errors.full_messages.first).to eq 'Words is invalid'
        end
      end
    end# }}}
  end
end
