# frozen_string_literal: true
require_relative "spec_helper"
RSpec.describe "to_word" do
  context '#to_word' do
    it "converts 1 to `one`" do
      expect(1.to_words).to eq("one")
    end

    it "converts '1' to `one`" do
      expect("1".to_words).to eq("one")
    end

    it "converts '1,000' to `one Thousand`" do
      expect(1_000.to_words).to eq("one Thousand")
    end

    it "converts '1,001' to `one Thousand and one`" do
      expect(1_001.to_words).to eq("one Thousand and one")
    end

    it "converts '-1,001' to `negative one Thousand and one`" do
      expect(-1_001.to_words).to eq("negative one Thousand and one")
    end

    it "returns the word equivalent of `1_000_100_101`" do
      num = "one Billion, one Hundred Thousand, one Hundred and one"
      expect(1_000_100_101.to_words).to eq num
    end

    it "returns the word equivalent of `1_000_100_101`" do
      num = "twelve Million, five Hundred fifty four"\
      " Thousand, six Hundred and fifty five"
      expect(12_554_655.to_words).to eq num
    end

    it "raises error for non-numerical string '1d'" do
      expect { "1d".to_words }.to raise_error "A whole number is expected"
    end

    it "raises error for non-numerical string 'd1'" do
      expect { "d1".to_words }.to raise_error "A whole number is expected"
    end

    it "it extends Fixnum class" do
      expect(1.methods).to include :to_words
    end

    it "it extends Srring class" do
      expect("1".methods).to include :to_words
    end
  end
end
