#!/data/data/com.termux/files/usr/bin/ruby

input = []
File.read(ARGV[0]).split("\n").each do |l|
	input << l.to_i
end

i = 0
steps = 0

while true
	jump = input[i]
	if jump >= 3
		input[i] -= 1
	else
		input[i] += 1
	end
	i += jump
	steps += 1
	break if i < 0 or i >= input.size
end

p steps

