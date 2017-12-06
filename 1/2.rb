#!/data/data/com.termux/files/usr/bin/ruby

input = File.read(ARGV[0]).chomp.split("").map do |i| i.to_i end

sum = 0
input.each_with_index do |item,index|
	if index+input.size/2 >= input.size-1
		if item == input[(index+input.size/2) % input.size]
			sum += item
		end
	else
		if item == input[index+input.size/2]
			sum += item
		end
	end
end

p sum
