#Reverse a string without using .reverse

puts "What is your string?"
	string = gets.chomp.split("")

backwards_array = Array.new
	until string.empty?
	  backwards_array.push(string.pop)
	end

puts backwards_array.join