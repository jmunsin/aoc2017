#!/data/data/com.termux/files/usr/bin/ruby

input = []
File.read(ARGV[0]).split("\n").each do |l|
	input << l.split(" ").map do |i| i.to_i end
end

sum = 0
input.each do |l|
	l.permutation(2).each do |a,b|
		if a % b == 0
			sum += a/b
		end
	end
end

p sum

