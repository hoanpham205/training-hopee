Common Array Methods

For the purpose of this guide, our array will be as follows:

array = [0, 1, 2, 3, 4]



.length
    The .length method tallies the number of elements in your array and returns the count:

      array.length
      => 5



.first
    The .first method accesses the first element of the array, the element at index 0:

      array.first
      => 0



.last
    The .last method accesses the last element of the array:

      array.last
      => 4



.take
    The .take method returns the first n elements of the array:

      array.take(3)
      => [0, 1, 2]



.drop
    The .drop method returns the elements after n elements of the array:

      array.drop(3)
      => [3, 4]



array index
    You can access a specific element in an array by accessing its index. If the index does not exist in the array, nil will be returned:

      array[2]
      => 2

      array[5]
      => nil



.pop
    The .pop method will permantently remove the last element of an array:

      array.pop
      => [0, 1, 2, 3]



.shift
    The .shift method will permantently remove the first element of an array and return this element:

      array.shift
      => 0  
      array
      => [1, 2, 3, 4]



.push
    The .push method will allow you to add an element to the end of an array:

      array.push(99)
      => [0, 1, 2, 3, 4, 99]



.unshift
    The .unshift method will allow you to add an element to the beginning of an array:

      array = [2, 3]
      array.unshift(1)
      => [1, 2, 3]



.delete
    The .delete method removes a specified element from an array permanently:

      array.delete(1)
      => [0, 2, 3, 4]



.delete_at
    The .delete_at method allows you to permanently remove an element of an array at a specified index:

      array.delete_at(0)
      => [1, 2, 3, 4]



.reverse
    The .reverse method reverses the array but does not mutate it (the original array stays as is):

      array.reverse
      => [4, 3, 2, 1, 0]



.select
    The .select method iterates over an array and returns a new array that includes any items that return true to the expression provided.

      array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
      array.select { |number| number > 4 }
      => [5, 6, 7, 8, 9, 10]
      array
      => [5, 6, 7, 8, 9, 10]



.include?
    The include? method checks to see if the argument given is included in the array:

      array = [1, 2, 3, 4, 5]
      => [1, 2, 3, 4, 5]
      array.include?(3)
      => true


      array = [1, 2, [3, 4, 5], [6, 7]]
      array.flatten
      => [1, 2, 3, 4, 5, 6, 7]



.join
    The .join method returns a string of all the elements of the array separated by a separator parameter. If the separator parameter is nil, the method uses an empty string as a separator between strings.

      array.join
      => "1234"
      array.join("*")
      => "1*2*3*4"



.each
    The .each method iterates over each element of the array, allowing you to perform actions on them.

      array.each do |element|
        puts element
      end
      => 
        0
        1
        2
        3
        4



.map
    The .map method is the same as the .collect method. The .map and .collect methods iterate over each element of the array, allowing you to perform actions on them. The .map and .collect methods differ from the .each method in that they return an array containing the transformed elements.

      array.map { |element| element * 2 }
        puts element
      end
      => 
      0
      2
      4
      6
      8



.uniq
    The .uniq method takes in an array containing duplicate elements, and returns a copy of the array containing only unique elements—any duplicate elements are removed from the array.

      array = [1, 1, 2, 2, 3, 3, 3, 4, 4, 4, 4, 5, 6, 7, 8]
      array.uniq
      => [1, 2, 3, 4, 5, 6, 7, 8]


      
.concat
    The .concat method appends the elements from an array to the original array. The .concat method can take in multiple arrays as an argument, which will in turn append multiple arrays to the original array.

      array = [0, 1, 2, 3, 4]
      array.concat([5, 6, 7], [8, 9, 10])
      => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]