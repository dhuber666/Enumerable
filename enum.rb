module Enumerable

  def my_each

    index = 0

    while index < self.length


      yield (self[index])

      index += 1


    end

    return self

  end


  def my_each_with_index

    index = 0

    while index < self.length

      yield self[index], index

      index += 1

    end

    return self

  end


  def my_select

    new_array = []

    self.my_each do |item|

      if yield item
        new_array << item
      end

    end

    return new_array

  end

  def my_all?

    self.my_each do |element|

      if !yield element
        puts "false"
        return false

        break
      end

    end
    puts "true"
    return true

  end

  def my_any?

    self.my_each do |element|


      if yield element
        puts "true"
        return true
        break
      end

    end

    puts "false"
    return "false"

  end

  def my_none?

    self.my_each do |item|


      if yield item

        puts "false"
        return false
        break


      end

    end

    puts "true"
    return true

  end

  def my_count (argument = nil)

    counter = 0
    if block_given?
      self.my_each do |item|

        if yield item

          counter += 1

        end

      end

    else

      self.my_each do |item|

        if item == argument

          counter += 1

        end

      end

    end

    puts "Das Argument kommt #{counter} x vor"
    return counter



  end

  def my_map

    new_array = []

    self.my_each do |item|

      new_array << yield item
    end


    new_array.my_each do |item|

      puts item

    end


    return new_array

  end


end

array = [2, 2, 7, 7]

array.my_map do |item|

  item * 2

end


array.my_count 7

array.my_count do |number|


  number % 2 == 0

end

array.my_each do |word|

  puts word + 2

end

list1 = ["hi", "wie", "gehts"]

list1.my_each_with_index do |word, index|

  puts "#{word} has index of #{index}"
end


ordered_array = array.my_select do |item|

  item%2==0

end

ordered_array.my_each do |word|

  puts word

end


array.my_all? do |item|

  item%2==0

end

array.my_any? do |item|

  item%2==0

end

array.my_none? do |item|

  item%2==0

end
