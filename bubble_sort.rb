#returns a sorted array

def bubble_sort(array)
	
	swapped = true
	
	while swapped
		swapped = false
	  (0..array.length-2).each do |e|
	    if (array[e] > array[e+1])
	      array[e], array[e+1] = array[e+1], array[e]
	      swapped = true
	    end
	  end
	end
	puts array
end

practice = [5,0,2,1,4]

bubble_sort(practice)

# accepts a block and returns a sorted array
def bubble_sort_by(array)
	
	swapped = true
	
	while swapped
		swapped = false
	  (0..array.length-2).each do |e|
	  	yield(array[e], array[e+1])
	    if (array[e] > array[e+1])
	      array[e], array[e+1] = array[e+1], array[e]
	      swapped = true
	    end
	  end
	end
	puts array
end

blocker = bubble_sort_by(["hola", "hi", "peace"]) do |lefty, righty|
	righty <=> lefty
    end

puts blocker