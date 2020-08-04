require '../enumerable.rb'

describe Enumerable do
  let(:spec_num_array) { [*1..20] }
  let(:spec_range) { (1..20) }
  let(:spec_hash) { { a: 1, b: 2, c: 3, d: 4 } }
  # my_each
  describe "#my_each" do
    it "returns the same value as the original given an array and a block" do
      expect(spec_num_array.my_each { |n| n * 2 }).to eql(spec_num_array.each { |n| n * 2 })
    end
  end

  # my_each_with_index

  # my_select

  # my_all

  # my_none

  # my_any

  # my_count

  # my_map

  # my_inject

  # mult_els, map_with_proc, map_with_proc_block

end