module Enumerable
  # my_each method
  def my_each
    arr = to_a
    arr.length.times { |i| yield arr[i] } if block_given?
    self
  end

  # my_each_with_index
  def my_each_with_index
    array = to_a
    array.length.times { |i| yield array[i], i } if block_given?
    self
  end

  # my_select
  def my_select
    array = to_a
    final_array = []
    if block_given?
      array.my_each { |i| final_array << i if yield i }
      final_array = final_array.to_h if is_a? Hash
      final_array
    else
      self
    end
  end

  # my_all
  def my_all?
    confirm = true
    array = to_a
    if block_given?
      array.my_each do |i|
        confirm = yield i
        break unless confirm
      end
    else
      array.my_each do |i|
        confirm = !(i == false || i.nil?) ? true : false 
        break unless confirm
      end
    end
    confirm
  end

  #my_any?
  def my_any?
    confirm = false
    array = self.to_a
    if block_given?
      array.my_each do |i|
        confirm = yield i
        break if confirm
      end
    else
      array.my_each do |i|
        confirm = !(i == false || i.nil?) ? true : false 
        break if confirm
      end
    end
    confirm
  end
end
