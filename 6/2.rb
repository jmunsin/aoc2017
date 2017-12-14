#!/usr/bin/ruby

input = []
File.read(ARGV[0]).split(" ").each do |l|
	input << l.to_i
end

n_blocks = input.size

configurations = Hash.new(0)
last_seen = Hash.new(0)
n_iter = 0
while true
  configurations[input.to_s] += 1
  if configurations[input.to_s] > 1
    break
  end
  configurations.each do |k, v|
    if v > 0
      last_seen[k.to_s] += 1
    end
  end
  max = -1
  start = -1
  input.each_with_index do |e, i|
    if e > max
      max = e
      start = i
    end
  end

  to_spread = max
  input[start] = 0
  start += 1
  to_spread.times do |i|
    j = (start + i) % n_blocks
    input[j] += 1
  end
  n_iter += 1
end

p last_seen[input.to_s]
