module Enumerable
  # my_each method
  def my_each
    arr = to_a
    arr.length.times { |i| yield arr[i] } if block_given? self
  end

  def my_each_with_index
    array = to_a
    array.length.times { |i| yield array[i], i } if block_given? self
  end
end

