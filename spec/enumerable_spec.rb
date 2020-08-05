require 'rspec'
require './enumerable.rb'

describe Enumerable do
    let(:array){[1, 2, 3]}
    let(:hash){{one: 1, two: 1, three: 2}}
    let(:range){(1..10)}

    let(:pr){Proc.new{
      |num|
      num
    }}

  describe "#my_each" do
    it "returns an Enumerator when no block is given" do
      expect(array.my_each).to be_an(Enumerator)
    end

    it "returns self when self is an array and  block is given" do
      expect(array.my_each{|num| num}).to eql(array)
    end

    it "returns self when self is a hash and  block is given" do
      expect(hash.my_each{|num| num}).to eql(hash)
    end

    it "returns self when self is a range and  block is given" do
      expect(range.my_each{|num| num}).to eql(range)
    end

    it "returns self when self is an array and proc is given" do
      expect(array.my_each(&pr)).to eql(array)
    end

    it "returns self when self is a hash and proc is given" do
      expect(hash.my_each(&pr)).to eql(hash)
    end

    it "returns self when self is a hash and proc is given" do
      expect(range.my_each(&pr)).to eql(range)
    end
  end

  describe "#my_each_with_index" do
    it "returns an Enumerator when no block is given" do
      expect(array.my_each_with_index).to be_an(Enumerator)
    end

    it "returns self when self is an array and  block is given" do
      expect(array.my_each_with_index{|num| num}).to eql(array)
    end

    it "returns self when self is a hash and  block is given" do
      expect(hash.my_each_with_index{|num| num}).to eql(hash)
    end

    it "returns self when self is a range and  block is given" do
      expect(range.my_each_with_index{|num| num}).to eql(range)
    end

    it "returns self when self is an array and proc is given" do
      expect(array.my_each_with_index(&pr)).to eql(array)
    end

    it "returns self when self is a hash and proc is given" do
      expect(hash.my_each_with_index(&pr)).to eql(hash)
    end

    it "returns self when self is a hash and proc is given" do
      expect(range.my_each_with_index(&pr)).to eql(range)
    end
  end
end