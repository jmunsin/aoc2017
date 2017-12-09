#!/data/data/com.termux/files/usr/bin/ruby

size = 11

map = Array.new(size, 0)
size.times do |i|
	map[i] = Array.new(size, 0)
end

x = size/2
y = size/2
map[y-1][x-1] = 5
map[y-1][x] = 4
map[y-1][x+1] = 2
map[y][x-1] = 10
map[y][x] = 1
map[y][x+1] = 1
map[y+1][x-1] = 11
map[y+1][x] = 23
map[y+1][x+1] = 25

x += 2
y += 1

input = 312051
direction = 0
iter = 1
while iter < size/2-1
	go_out = false
	while not go_out
		case direction
		when 0
			raise if map[y][x] != 0
			map[y][x] = map[y-1][x-1] + map[y-1][x] + map[y-1][x+1] + map[y][x-1] + map[y][x+1] + map[y+1][x-1] + map[y+1][x] + map[y+1][x+1]
			raise map[y][x].to_s if map[y][x] > input
			if (y-size/2).abs <= iter
				y -= 1
			else
				x -= 1
				direction = 1
			end
		when 1
			raise if map[y][x] != 0
			map[y][x] = map[y-1][x-1] + map[y-1][x] + map[y-1][x+1] + map[y][x-1] + map[y][x+1] + map[y+1][x-1] + map[y+1][x] + map[y+1][x+1]
			raise map[y][x].to_s if map[y][x] > input
			if (x-size/2).abs <= iter
				x -= 1
			else
				y += 1
				direction = 2
			end
		when 2
			raise if map[y][x] != 0
			map[y][x] = map[y-1][x-1] + map[y-1][x] + map[y-1][x+1] + map[y][x-1] + map[y][x+1] + map[y+1][x-1] + map[y+1][x] + map[y+1][x+1]
			raise map[y][x].to_s if map[y][x] > input
			if (y-size/2).abs <= iter
				y += 1
			else
				x += 1
				direction = 3
			end
		when 3
			raise if map[y][x] != 0
			map[y][x] = map[y-1][x-1] + map[y-1][x] + map[y-1][x+1] + map[y][x-1] + map[y][x+1] + map[y+1][x-1] + map[y+1][x] + map[y+1][x+1]
			raise map[y][x].to_s if map[y][x] > input
			if (x-size/2).abs <= iter
				x += 1
			else
				direction = 4
			end
		when 4
			x += 1
			go_out = true
			direction = 0
		end
	end
	iter += 1
end

map.each do |l|
	l.each do |i|
		printf "%6i", i
	end
	puts
end

