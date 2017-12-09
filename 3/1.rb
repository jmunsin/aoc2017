#!/data/data/com.termux/files/usr/bin/ruby

def spiral(n, item)
	if n == 0
		if item == 1
			return [0,0]
		else
			return nil
		end
	#elsif n == 1
	#	return [2, 3, 4, 5, 6, 7, 8, 9]
	else
		# 0 1 2  3  4    n
		# 1 3 5  7  9    höjd
		# 1 8 16 24 32   antal
		# 1 2 10 26 50   start
		height = 2*n+1
		pieces = height*4 - 4
		offset = 1
		n.times do |i|
			h = 2*i+1
			pcs = h*4 - 4
			offset += pcs
		end
		pieces.times do |i|
			if item == (i+1+offset)
				y = i % (height-1) + 1
				y -= (height-1)/2
				return [n,y]
			end
		end
		return nil
	end
end

def manhattan_distance(q)
	iter = 0
	while true do
		coord = spiral(iter, q)
		if coord != nil
			return coord[0].abs + coord[1].abs
		end
		iter += 1
	end
end

p manhattan_distance(12)
p manhattan_distance(23)
p manhattan_distance(1024)
p manhattan_distance(312051)

