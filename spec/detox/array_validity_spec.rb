# coding: utf-8
require "spec_helper"
require "test_class/array_validity_test"

describe Detox::ArrayValidity do
  let(:test) { ArrayValidityTest.new }

  describe "#convert_to_validatee" do
    context "without option" do# {{{
      context "when given Array" do
        let(:actual) { test.convert_to_validatee(["1", nil, "2", "", "3", "  "]) }

        it "returns itself" do
          expect(actual).to eq ["1", nil, "2", "", "3", "  "]
        end
      end

      context "when given Hash" do
        let(:actual) { test.convert_to_validatee({ :a => "1", :b => nil, :c => "2" , :d => "", :e => "3", :f => "  "}) }

        it "returns Array that contains given Hash values" do
          expect(actual).to eq ["1", nil, "2", "", "3", "  "]
        end
      end

      context "when given nil" do
        let(:actual) { test.convert_to_validatee(nil) }

        it "returns empty Array" do
          expect(actual).to eq []
        end
      end

      context "when given other data" do
        context "when data is not blank" do
        let(:actual) { test.convert_to_validatee("data") }

          it "returns Array that has given data only" do
            expect(actual).to eq ["data"]
          end
        end
        context "when data is empty" do
          let(:actual) { test.convert_to_validatee("") }

          it "returns empty Array that has empty data only" do
            expect(actual).to eq [""]
          end
        end
        context "when data is blank" do
          let(:actual) { test.convert_to_validatee("  ") }

          it "returns Array that has given blank data only" do
            expect(actual).to eq ["  "]
          end
        end
      end
    end# }}}

    context "with ignore_nil_value option" do# {{{
      let(:options) { { :ignore_nil_value => true } }
      context "when given Array" do
        let(:actual) { test.convert_to_validatee(["1", nil, "2", "", "3", "  "], options) }

        it "returns Array that removed nil" do
          expect(actual).to eq ["1", "2", "", "3", "  "]
        end
      end

      context "when given Hash" do
        let(:actual) { test.convert_to_validatee({ :a => "1", :b => nil, :c => "2" , :d => "", :e => "3", :f => "  "}, options) }

        it "returns Array that contains given Hash not nil values" do
          expect(actual).to eq ["1", "2", "", "3", "  "]
        end
      end

      context "when given nil" do
        let(:actual) { test.convert_to_validatee(nil, options) }

        it "returns empty Array" do
          expect(actual).to eq []
        end
      end

      context "when given other data" do
        context "when data is not blank" do
          let(:actual) { test.convert_to_validatee("data", options) }

          it "returns Array that has given data only" do
            expect(actual).to eq ["data"]
          end
        end
        context "when data is empty" do
          let(:actual) { test.convert_to_validatee("", options) }

          it "returns Array that has empty data only" do
            expect(actual).to eq [""]
          end
        end
        context "when data is blank" do
          let(:actual) { test.convert_to_validatee("  ", options) }

          it "returns Array that has given blank data only" do
            expect(actual).to eq ["  "]
          end
        end
      end
    end# }}}

    context "with ignore_blank_value option" do# {{{
      let(:options) { { :ignore_blank_value => true } }

      context "when given Array" do
        let(:actual) { test.convert_to_validatee(["1", nil, "2", "", "3", "  "], options) }

        it "returns Array that removed blank values" do
          expect(actual).to eq ["1", "2", "3"]
        end
      end

      context "when given Hash" do
        let(:actual) { test.convert_to_validatee({ :a => "1", :b => nil, :c => "2" , :d => "", :e => "3", :f => "  "}, options) }

        it "returns Array that contains given Hash not blank values" do
          expect(actual).to eq ["1", "2", "3"]
        end
      end

      context "when given nil" do
        let(:actual) { test.convert_to_validatee(nil, options) }

        it "returns empty Array" do
          expect(actual).to eq []
        end
      end

      context "when given other data" do
        context "when data is not blank" do
          let(:actual) { test.convert_to_validatee("data", options) }

          it "returns Array that has given data only" do
            expect(actual).to eq ["data"]
          end
        end
        context "when data is empty" do
          let(:actual) { test.convert_to_validatee("", options) }

          it "returns empty Array" do
            expect(actual).to eq []
          end
        end
        context "when data is blank" do
          let(:actual) { test.convert_to_validatee("  ", options) }

          it "returns empty Array" do
            expect(actual).to eq []
          end
        end
      end
    end# }}}

    context "with option that value is false" do# {{{
      let(:options) { { :ignore_nil_value => false, :ignore_blank_value => false } }

      context "when given Array" do
        let(:actual) { test.convert_to_validatee(["1", nil, "2", "", "3", "  "]) }

        it "returns itself" do
          expect(actual).to eq ["1", nil, "2", "", "3", "  "]
        end
      end

      context "when given Hash" do
        let(:actual) { test.convert_to_validatee({ :a => "1", :b => nil, :c => "2" , :d => "", :e => "3", :f => "  "}) }

        it "returns Array that contains given Hash values" do
          expect(actual).to eq ["1", nil, "2", "", "3", "  "]
        end
      end

      context "when given nil" do
        let(:actual) { test.convert_to_validatee(nil) }

        it "returns empty Array" do
          expect(actual).to eq []
        end
      end

      context "when given other data" do
        context "when data is not blank" do
          let(:actual) { test.convert_to_validatee("data") }

          it "returns Array that has given data only" do
            expect(actual).to eq ["data"]
          end
        end
        context "when data is empty" do
          let(:actual) { test.convert_to_validatee("") }

          it "returns empty Array that has empty data only" do
            expect(actual).to eq [""]
          end
        end
        context "when data is not blank" do
          let(:actual) { test.convert_to_validatee("  ") }

          it "returns Array that has given blank data only" do
            expect(actual).to eq ["  "]
          end
        end
      end
    end# }}}
  end
end
