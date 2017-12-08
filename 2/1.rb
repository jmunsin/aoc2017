#!/data/data/com.termux/files/usr/bin/ruby

input = []
File.read(ARGV[0]).split("\n").each do |l|
	input << l.split(" ").map do |i| i.to_i end
end

sum = 0
input.each do |l|
	sum += l.max - l.min
end

p sum

