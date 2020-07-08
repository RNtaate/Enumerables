module Enumerable
#my_each method
  def my_each (&block)

    if block_given?

      case self

      when Array
        i = 0
        arr = self
        while i < arr.length
          yield(arr[i])
          i += 1
        end
        self

      when Hash
        arr = self.flatten
        i = 1
        while i < arr.length
          yield(arr[i - 1], arr[i])
          i += 2
        end
        self

      when Range
        for i in self
          yield i
        end
        self
      else
        return "Error: Method not applicable"
      end

    else
      self
    end

  end

end
