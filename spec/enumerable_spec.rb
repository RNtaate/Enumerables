require 'enumerable'

describe Enumerable do
  let(:spec_num_array) { [*1..20] }
  let(:spec_range) { (1..20) }
  let(:spec_hash) { { a: 1, b: 2, c: 3, d: 4 } }    
  
  # my_each
  describe "#my_each" do
    it "returns the same value as the original given an array and a block" do
      expect(spec_num_array.my_each { |n| n * 2 }).to eql(spec_num_array.each { |n| n * 2 })
    end

    it "returns the same value as the original given a range and a block" do
      expect(spec_range.my_each { |n| n * 2 }).to eql(spec_range.each { |n| n * 2 })
    end

    it "returns the same value as the original given a hash and a block" do
      expect(spec_hash.my_each { |n| n * 2 }).to eql(spec_hash.each { |n| n * 2 })
    end    
  end

  # my_each_with_index
  describe "#my_each_with_index" do
    it "returns the same value as the original given an array and a block" do
      expect(spec_num_array.my_each_with_index { |a,b| a + b }).to eql(spec_num_array.each_with_index { |a,b| a + b })
    end

    it "returns the same value as the original given a range and a block" do
      expect(spec_range.my_each_with_index { |a,b| a + b }).to eql(spec_range.each_with_index { |a,b| a + b })
    end

  end

  # my_select
  describe "#my_select" do
    it "returns the same value as the original given an array and a block" do
      expect(spec_num_array.my_select { |v| v.even? }).to eql(spec_num_array.select { |v| v.even? })
    end

    it "returns the same value as the original given a range and a block" do
      expect(spec_range.my_select { |v| v.even? }).to eql(spec_range.select { |v| v.even? })
    end

    it "returns the same value as the original given a hash and a block" do
      expect(spec_hash.my_select { |k,v| v.even? }).to eql(spec_hash.select { |k,v| v.even? })
    end
  end

  # my_all
  describe "my_all" do
    it "returns true if all values are smaller than 21" do
      expect(spec_num_array.my_all? { |v| v < 21 } ).to eql(spec_num_array.all? { |v| v < 21 })
    end

    it "returns false if a value in the array doesn't satisfy the block condition" do
      expect(spec_num_array.my_all? { |v| v < 10 } ).to eql(spec_num_array.all? { |v| v < 10 })
    end
  end

  # my_none
  describe "#my_none?" do
    it 'return false if any of the elements in the array is equal to true.' do
      expect(spec_num_array.my_none? { |el| el.even? }).to eql(false)
    end
  end

  # my_any

  # my_count

  # my_map

  # my_inject

  # mult_els, map_with_proc, map_with_proc_block

end