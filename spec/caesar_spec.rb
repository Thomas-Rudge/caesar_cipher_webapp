require 'spec_helper'
require_relative '../lib/caesar'

describe "#cipher" do
  context "Standard Operation" do
    let (:word)         { "Caesar cipher" }
    let (:shift)        { 13 }
    let (:big_shift)    { 2649 }
    let (:right_result) { "Pnr!n -pv}ur " }
    let (:left_result)  { "6TXfTerV\\c[Xe" }
    let (:big_result)   { "8VZhVgtX^e]Zg" }

    it "will correctly shift letters to the right" do
      expect(cipher(word, shift)).to eql right_result
    end

    it "will correctly shift letters to the left" do
      expect(cipher(word, shift*-1)).to eql left_result
    end

    it "will handle shift values greater than the number of printable characters" do
      expect(cipher(word, big_shift)).to eql big_result
    end
  end

  context "Given an unprintable character" do
    let (:word)  { "\t\v\n\r\a\b" }
    let (:shift) { 3 }

    it "will ignore it" do
      expect(cipher(word, shift)).to be_empty
    end
  end

  context "Asked to shift an empty string" do
    let (:word)  { "" }
    let (:shift) { 7 }

    it "will ignore it" do
      expect(cipher(word, shift)).to be_empty
    end
  end

  context "Asked to shift by zero characters" do
    let (:word)  { "Zero shifted 123" }
    let (:shift) { 0 }

    it "will ignore it" do
      expect(cipher(word, shift)).to eql word
    end
  end
end
