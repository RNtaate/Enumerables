require 'rspec'
require './enumerable.rb'

describe Enumerable do
  let(:array) { [1, 2, 3] }
  let(:hash) { { one: 1, two: 1, three: 2 } }
  let(:range) { (1..10) }

  let(:pr) do
    proc do |num|
      num
    end
  end

  describe '#my_each' do
    it 'returns an Enumerator when no block is given' do
      expect(array.my_each).to be_an(Enumerator)
    end

    it 'returns self when self is an array and  block is given' do
      expect(array.my_each { |num| num }).to eql(array)
    end

    it 'returns self when self is a hash and  block is given' do
      expect(hash.my_each { |num| num }).to eql(hash)
    end

    it 'returns self when self is a range and  block is given' do
      expect(range.my_each { |num| num }).to eql(range)
    end

    it 'returns self when self is an array and proc is given' do
      expect(array.my_each(&pr)).to eql(array)
    end

    it 'returns self when self is a hash and proc is given' do
      expect(hash.my_each(&pr)).to eql(hash)
    end

    it 'returns self when self is a hash and proc is given' do
      expect(range.my_each(&pr)).to eql(range)
    end
  end

  describe '#my_each_with_index' do
    it 'returns an Enumerator when no block is given' do
      expect(array.my_each_with_index).to be_an(Enumerator)
    end

    it 'returns self when self is an array and  block is given' do
      expect(array.my_each_with_index { |num| num }).to eql(array)
    end

    it 'returns self when self is a hash and  block is given' do
      expect(hash.my_each_with_index { |num| num }).to eql(hash)
    end

    it 'returns self when self is a range and  block is given' do
      expect(range.my_each_with_index { |num| num }).to eql(range)
    end

    it 'returns self when self is an array and proc is given' do
      expect(array.my_each_with_index(&pr)).to eql(array)
    end

    it 'returns self when self is a hash and proc is given' do
      expect(hash.my_each_with_index(&pr)).to eql(hash)
    end

    it 'returns self when self is a hash and proc is given' do
      expect(range.my_each_with_index(&pr)).to eql(range)
    end
  end

  describe '#my_select' do
    it 'returns an Enumerator when no block is given' do
      expect(array.my_select).to be_an(Enumerator)
    end

    it 'returns an array containing elements that passed a particular condition in a block when called on an array' do
      expect(array.my_select { |num| num < 2 }).to eql([1])
    end

    it 'returns a hash containing elements that passed a particular condition in a block when called on a hash' do
      expect(hash.my_select { |_key, num| num < 2 }).to eql({ one: 1, two: 1 })
    end

    it 'returns an array containing elements that passed a particular condition in a block when called on a range' do
      expect(range.my_select { |num| num < 5 }).to eql([1, 2, 3, 4])
    end
  end

  describe "#my_all?" do
    it "returns true if all elements of the array that my_all? is called on are true and no block is given" do
      expect(array.my_all?).to be true
    end

    it "returns false if atleast one element of the array that my_all? is called on is false or nil and no block is given" do
      expect([false, nil].my_all?).to be false
    end

    it "returns true if self is a hash and no block is given" do
      expect(hash.my_all?).to be true
    end

    it "returns true if self is a range and no block is given" do
      expect(range.my_all?).to be true
    end

    it "returns true if self is an array and all it's elements pass for the condition in a given block" do
      expect(array.my_all?{|num| num.positive?}).to be true
    end

    it "returns false if self is an array and atleast one of it's elements fails the condition in a given block" do
      expect(array.my_all?{|num| num.even?}).to be false
    end

    it "returns true if self is a hash and all it's elements pass for the condition in a given block" do
      expect(hash.my_all?{|key, num| num.positive?}).to be true
    end

    it "returns false if self is a hash and atleast one of it's elements fails the condition in a given block" do
      expect(hash.my_all?{|key, num| num.even?}).to be false
    end

    it "returns true if self is a range and all it's elements pass for the condition in a given block" do
      expect(range.my_all?{|num| num.positive?}).to be true
    end

    it "returns false if self is a range and atleast one of it's elements fails the condition in a given block" do
      expect(range.my_all?{|num| num.even?}).to be false
    end

    it "returns true if self is an array and all elements match specified element given as an argument" do
      expect([1,1,1,1].my_all?(1)).to be true
    end

    it "returns false if self is an array and atleast one of the elements do not match the specified element given as an argument" do
      expect(array.my_all?(1)).to be false
    end

    it "returns false if self is a hash and an argument is given that doesn't match all of elements" do
      expect(hash.my_all?(1)).to be false
    end

    it "returns true if self is an empty hash and the argument given is a Hash" do
      expect({}.my_all?(Hash)).to be true
    end

    it "returns true if self is a range of 1 number that matches the given argument" do
      expect((1..1).my_all?(1)).to be true
    end

    it "returns false if self is a range and the argument given does not match all of the numbers that the range generates" do
      expect(range.my_all?(1)).to be false
    end
  end

  describe "#my_any?" do
    it "returns true if any element of the array that my_any? is called on is true and no block is given" do
      expect(array.my_any?).to be true
    end

    it "returns false if all elements of the array that my_any? is called on are false or nil and no block is given" do
      expect([false, nil].my_any?).to be false
    end

    it "returns true if self is an empty array and no block is given" do
      expect([].my_any?).to be false
    end

    it "returns true if self is not an empty hash and no block is given" do
      expect(hash.my_any?).to be true
    end

    it "return false if self is an empty hash and no block is given" do
      expect({}.my_any?).to be false
    end

    it "returns true if self is a range and no block is given" do
      expect(range.my_any?).to be true
    end

    it "returns true if self is an array and any of it's elements pass for the condition in a given block" do
      expect(array.my_any?{|num| num.positive?}).to be true
    end

    it "returns false if self is an array and all of it's elements fail the condition in a given block" do
      expect(array.my_any?{|num| num.zero?}).to be false
    end

    it "returns true if self is a hash and any of it's elements pass for the condition in a given block" do
      expect(hash.my_any?{|key, num| num.positive?}).to be true
    end

    it "returns false if self is a hash and all of it's elements fail the condition in a given block" do
      expect(hash.my_any?{|key, num| num.zero?}).to be false
    end

    it "returns true if self is a range and any of it's elements pass for the condition in a given block" do
      expect(range.my_any?{|num| num == 2}).to be true
    end

    it "returns false if self is a range and all of it's elements fail the condition in a given block" do
      
      expect(range.my_any?{|num| num.zero?}).to be false
    end

    it "returns true if self is an array and any of it's elements match specified element given as an argument" do
      
      expect(array.my_any?(1)).to be true
    end

    it "returns false if self is an array and all of it's elements do not match the specified element given as an argument" do
      
      expect(array.my_any?(10)).to be false
    end

    it "returns false if self is a hash and an argument is given" do
      expect(hash.my_any?(1)).to be false
    end

    it "returns true if self is a range containing a number that matches the given argument" do
      
      expect(range.my_any?(1)).to be true
    end

    it "returns false if self is a range and the argument given does not match any of the numbers that the range generates" do
      expect(range.my_any?(0)).to be false
    end
  end
end
