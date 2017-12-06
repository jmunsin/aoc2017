#!/data/data/com.termux/files/usr/bin/ruby

input = File.read(ARGV[0]).chomp.split("").map do |i| i.to_i end

sum = 0
input.each_with_index do |item,index|
	if index >= input.size-1
		if item == input[0]
			sum += item
		end
	else
		if item == input[index+1]
			sum += item
		end
	end
end

p sum
