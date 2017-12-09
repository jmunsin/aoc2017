#!/data/data/com.termux/files/usr/bin/ruby

input = []
File.read(ARGV[0]).split("\n").each do |l|
	input << l.split(" ")
end

valid = 0
input.each do |orig|
	phrase = orig.map do |s|
		s.chars.sort.join
	end
	dup = false
	phrase.detect do |e|
		if phrase.count(e) > 1
			dup = true
		end
	end
	valid += 1 if !dup
end

p valid
