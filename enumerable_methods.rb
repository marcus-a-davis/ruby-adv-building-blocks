#!/usr/bin/ruby

module Enumerable
  def my_each
  	for element in self
  	  yield(element)
  	end
  	self
  end

  def my_each_with_index
  	index = 0
  	self.my_each do |element|
  		yield(element, index)
  		index+=1
  	end
  	self
  end 

  def my_select
  	result_array = []
  	self.my_each do |element|
  	  if yield(element)
  	    result_array << element
  	  end
  	end
  	result_array
  end

  def my_all?
  	self.my_each do |element|
  	 return false unless yield(element)
  	 true
  	end
  end

  def my_any?
  	self.my_each do |element|
  	 return true if yield(element)
  	 false
  	end
  end

  def my_none?
    self.my_each do |element|
      return false if yield(element)
      true 
    end
  end

  def my_count
    count = 0
    self.my_each do |element|
      count += if block_given?
                 yield(element) ? 1 : 0
               else
                 1
               end
    end
    count
  end

  def my_map(proc=nil)
    result = []
    if block_given? && proc
      self.my_each { |element| result << proc.call(yield(element)) }
    elsif !block_given? && proc
      self.my_each { |element| result << proc.call(element) }
    elsif block_given? && proc.nil?
      self.my_each { |element| result << yield(element) }
    else
      self.my_each { |element| yield(element) }
    end
    result
  end

  def my_inject(starter=nil)
    starter = self[0] if starter.nil?
    memo = starter
    self.my_each { |element| memo = yield(memo, element) }
    memo
  end
end

def multiply_els(arr)
  arr.my_inject(1) { |result, element| result * element }
end
