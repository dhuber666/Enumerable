module Enumerable

  def my_each

    index = 0

    while index < self.length


      yield (self[index])

      index += 1


    end

    return self

  end

end

array = [5, 2, 3, 4]

array.my_each do |word|

  puts word

end
