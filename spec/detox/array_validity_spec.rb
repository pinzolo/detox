# coding: utf-8
require "spec_helper"
require "test_class/array_validity_test"

describe Detox::ArrayValidity do
  before do
    @test = ArrayValidityTest.new
  end

  describe "#convert_to_validatee" do
    context "without option" do
      context "when given Array" do
        before do
          data = ["1", nil, "2", "", "3", "  "]
          @actual = @test.convert_to_validatee(data)
        end

        it "returns itself" do
          expect(@actual).to eq ["1", nil, "2", "", "3", "  "]
        end
      end

      context "when given Hash" do
        before do
          data = { :a => "1", :b => nil, :c => "2" , :d => "", :e => "3", :f => "  "}
          @actual = @test.convert_to_validatee(data)
        end

        it "returns Array that contains given Hash values" do
          expect(@actual).to eq ["1", nil, "2", "", "3", "  "]
        end
      end

      context "when given nil" do
        before do
          @actual = @test.convert_to_validatee(nil)
        end

        it "returns empty Array" do
          expect(@actual).to eq []
        end
      end

      context "when given other data" do
        context "when data is not blank" do
          before do
            @actual = @test.convert_to_validatee("data")
          end

          it "returns Array that has given data only" do
            expect(@actual).to eq ["data"]
          end
        end
        context "when data is empty" do
          before do
            @actual = @test.convert_to_validatee("")
          end

          it "returns empty Array that has empty data only" do
            expect(@actual).to eq [""]
          end
        end
        context "when data is not blank" do
          before do
            @actual = @test.convert_to_validatee("  ")
          end

          it "returns Array that has given blank data only" do
            expect(@actual).to eq ["  "]
          end
        end
      end
    end

    context "with ignore_nil_value option" do
      before do
        @options = { :ignore_nil_value => true }
      end
      context "when given Array" do
        before do
          data = ["1", nil, "2", "", "3", "  "]
          @actual = @test.convert_to_validatee(data, @options)
        end

        it "returns Array that removed nil" do
          expect(@actual).to eq ["1", "2", "", "3", "  "]
        end
      end

      context "when given Hash" do
        before do
          data = { :a => "1", :b => nil, :c => "2" , :d => "", :e => "3", :f => "  "}
          @actual = @test.convert_to_validatee(data, @options)
        end

        it "returns Array that contains given Hash not nil values" do
          expect(@actual).to eq ["1", "2", "", "3", "  "]
        end
      end

      context "when given nil" do
        before do
          @actual = @test.convert_to_validatee(nil, @options)
        end

        it "returns empty Array" do
          expect(@actual).to eq []
        end
      end

      context "when given other data" do
        context "when data is not blank" do
          before do
            @actual = @test.convert_to_validatee("data", @options)
          end

          it "returns Array that has given data only" do
            expect(@actual).to eq ["data"]
          end
        end
        context "when data is empty" do
          before do
            @actual = @test.convert_to_validatee("", @options)
          end

          it "returns Array that has empty data only" do
            expect(@actual).to eq [""]
          end
        end
        context "when data is not blank" do
          before do
            @actual = @test.convert_to_validatee("  ", @options)
          end

          it "returns Array that has given blank data only" do
            expect(@actual).to eq ["  "]
          end
        end
      end
    end

    context "with ignore_blank_value option" do
      before do
        @options = { :ignore_blank_value => true }
      end
      context "when given Array" do
        before do
          data = ["1", nil, "2", "", "3", "  "]
          @actual = @test.convert_to_validatee(data, @options)
        end

        it "returns Array that removed blank values" do
          expect(@actual).to eq ["1", "2", "3"]
        end
      end

      context "when given Hash" do
        before do
          data = { :a => "1", :b => nil, :c => "2" , :d => "", :e => "3", :f => "  "}
          @actual = @test.convert_to_validatee(data, @options)
        end

        it "returns Array that contains given Hash not blank values" do
          expect(@actual).to eq ["1", "2", "3"]
        end
      end

      context "when given nil" do
        before do
          @actual = @test.convert_to_validatee(nil, @options)
        end

        it "returns empty Array" do
          expect(@actual).to eq []
        end
      end

      context "when given other data" do
        context "when data is not blank" do
          before do
            @actual = @test.convert_to_validatee("data", @options)
          end

          it "returns Array that has given data only" do
            expect(@actual).to eq ["data"]
          end
        end
        context "when data is empty" do
          before do
            @actual = @test.convert_to_validatee("", @options)
          end

          it "returns empty Array" do
            expect(@actual).to eq []
          end
        end
        context "when data is not blank" do
          before do
            @actual = @test.convert_to_validatee("  ", @options)
          end

          it "returns empty Array" do
            expect(@actual).to eq []
          end
        end
      end
    end

    context "with option that value is false" do
      before do
        @options = { :ignore_nil_value => false, :ignore_blank_value => false }
      end
      context "when given Array" do
        before do
          data = ["1", nil, "2", "", "3", "  "]
          @actual = @test.convert_to_validatee(data)
        end

        it "returns itself" do
          expect(@actual).to eq ["1", nil, "2", "", "3", "  "]
        end
      end

      context "when given Hash" do
        before do
          data = { :a => "1", :b => nil, :c => "2" , :d => "", :e => "3", :f => "  "}
          @actual = @test.convert_to_validatee(data)
        end

        it "returns Array that contains given Hash values" do
          expect(@actual).to eq ["1", nil, "2", "", "3", "  "]
        end
      end

      context "when given nil" do
        before do
          @actual = @test.convert_to_validatee(nil)
        end

        it "returns empty Array" do
          expect(@actual).to eq []
        end
      end

      context "when given other data" do
        context "when data is not blank" do
          before do
            @actual = @test.convert_to_validatee("data")
          end

          it "returns Array that has given data only" do
            expect(@actual).to eq ["data"]
          end
        end
        context "when data is empty" do
          before do
            @actual = @test.convert_to_validatee("")
          end

          it "returns empty Array that has empty data only" do
            expect(@actual).to eq [""]
          end
        end
        context "when data is not blank" do
          before do
            @actual = @test.convert_to_validatee("  ")
          end

          it "returns Array that has given blank data only" do
            expect(@actual).to eq ["  "]
          end
        end
      end
    end
  end
end