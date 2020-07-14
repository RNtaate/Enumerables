module Enumerable
  UNDEFINED = Object.new

  # my_each method
  def my_each
    arr = to_a
    return to_enum unless block_given?

    arr.length.times { |i| yield arr[i] }
    self
  end

  # my_each_with_index
  def my_each_with_index
    array = to_a
    return to_enum unless block_given?

    array.length.times { |i| yield array[i], i }
    self
  end

  # my_select
  def my_select
    array = to_a
    final_array = []
    return to_enum unless block_given?

    array.my_each { |i| final_array << i if yield i }
    final_array = final_array.to_h if is_a? Hash
    final_array
  end

  # my_all
  def my_all?(arg = UNDEFINED)
    confirm = true
    array = to_a
    if arg != UNDEFINED
      if arg.is_a? Class
        array.my_each do |i|
          confirm = i.class.ancestors.include? arg
          break unless confirm
        end

      else
        array.my_each do |i|
          confirm = (arg === i)
          break unless confirm
        end
      end

    else
      if block_given?
        array.my_each do |i|
          confirm = yield i
          break unless confirm
        end
      else
        array.my_each do |i|
          confirm = !(i == false || i.nil?)
          break unless confirm
        end
      end
    end
    confirm
  end

  # my_any?
  def my_any?(arg = UNDEFINED)
    confirm = false
    array = to_a
    if arg != UNDEFINED
      if arg.is_a? Class
        array.my_each do |i|
          confirm = i.class.ancestors.include? arg
          break if confirm
        end

      else
        array.my_each do |i|
          confirm = (arg === i)
          break if confirm
        end
      end
    else
      if block_given?
        array.my_each do |i|
          confirm = yield i
          break if confirm
        end
      else
        array.my_each do |i|
          confirm = !(i == false || i.nil?)
          break if confirm
        end
      end
    end
    confirm
  end

  # my_none?
  def my_none?(arg = UNDEFINED)
    arr = to_a
    confirm = true
    if arg != UNDEFINED
      if arg.is_a? Class
        arr.my_each do |i|
          confirm = !(i.class.ancestors.include? arg)
          break unless confirm
        end

      else
        arr.my_each do |i|
          confirm = !(arg === i)
          break unless confirm
        end
      end
    else
      if block_given?
        arr.my_each do |i|
          confirm = !(yield i)
          break unless confirm
        end
      else
        arr.my_each do |i|
          confirm = (i == false || i.nil?)
          break unless confirm
        end
      end
    end
    confirm
  end

  # my_count
  def my_count(number = UNDEFINED)
    arr = to_a
    result = 0
    if number != UNDEFINED
      puts 'enumerable.rb:111: warning: given block not used' if block_given?
      arr.my_each { |i| result += 1 if number == i }

    elsif block_given?
      arr.my_each { |i| result += 1 if yield i }

    else
      result = arr.length
    end
    result
  end

  # my_map
  def my_map(prc = UNDEFINED)
    array = to_a
    result = []

    if prc != UNDEFINED
      array.my_each { |i| result << prc.call(i) }

    elsif block_given?
      array.my_each { |i| result << (yield i) }

    else
      result = to_enum
    end
    result
  end

  # my_inject
  def my_inject(num = UNDEFINED, num_two = UNDEFINED)
    arr = to_a
    sum = 0

    if num != UNDEFINED
      if num_two != UNDEFINED
        sum = num
        arr.my_each { |i| sum = sum.send(num_two.to_s, i) }

      else
        if (num.is_a? Symbol) || (num.is_a? String)
          sum = block_given? ? num : arr[0]
          counter = block_given? ? 0 : 1

          1.upto(arr.length - 1) { |i| sum = sum.send(num.to_s, arr[i]) } if num.is_a? Symbol

          counter.upto(arr.length - 1) { |i| sum = sum.send(num.to_s, arr[i]) } if num.is_a? String

        else
          sum = num
          arr.my_each { |i| sum = yield sum, i }
        end
      end

    else
      sum = arr[0]
      1.upto(arr.length - 1) { |i| sum = yield sum, arr[i] }
    end
    sum
  end
end

def multiply_els(arg)
  arg.my_inject(:*)
end
