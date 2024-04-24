module Enumerable
  # Your code goes here
  def my_each_with_index
    i = 0
    self.my_each do |item|
      yield(item, i)
      i += 1
    end
    self
  end

  def my_select
    array = []
    self.my_each do |item|
      array << item if yield(item)
    end
    array
  end

  def my_all?
    self.my_each do |item|
      return false unless yield(item)
    end
    true
  end

  def my_any?
    self.my_each do |item|
      return true if yield(item)
    end
    false
  end

  def my_none?
    self.my_each do |item|
      return false if yield(item)
    end
    true
  end

  def my_count()
    count = 0
    self.my_each do |item|
      if block_given?
        count += 1 if yield(item)
      else
        count += 1
      end
    end
    count
  end

  def my_map
    array = []
    self.my_each do |item|
      array << yield(item)
    end
    array
  end

  def my_inject(var = 0)
    self.my_each do |item|
      var = yield(item, var)
    end
    var
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    counter = self.count
    i = 0
    while i < counter
      yield self[i]
      i += 1
    end
    self
  end
end
