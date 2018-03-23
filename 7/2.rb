#!/data/data/com.termux/files/usr/bin/ruby

class Node
	attr_accessor :children, :weight, :name
	def initialize(name)
		@name = name
		@children = {}
	end
	def total_weight
		w = @weight
		@children.each do |k, v|
			w += v.total_weight
		end
		return w
	end
end

nodes = {}
File.read(ARGV[0]).split("\n").each do |l|
	r = l.split("->")
	children = nil
	if r.size > 1
		children = r[1].tr(" ", "").split(",")
	end
	s = r[0].split(" ")
	name = s[0]
	weight = s[1].tr("(", "").tr(")", "").to_i
	if nodes[name] == nil
		n = Node.new(name)
		nodes[name] = n
	else
		n = nodes[name]
	end
	n.weight = weight
	if children != nil
		children.each do |c|
			if nodes[c] == nil
				nc = Node.new(name)
				n.children[c] = nc
				nodes[c] = nc
			else
				n.children[c] = nodes[c]
			end
		end
	end
end

max = 0
root = nil
nodes.each do |k,v|
	if v.total_weight > max
		max = v.total_weight
		root = k
	end
end


def find_wrong(node)
	w = nil
	wrong = false
	node.children.each do |k, v|
		if w == nil
			w = v.total_weight
		else
			if v.total_weight != w
				#p k
				#p w
				#p v.total_weight
				wrong = true
			end
		end
	end
	if wrong
		node.children.each do |k, v|
			puts "#{k}: #{v.total_weight} #{v.weight}"
			n = find_wrong(v)
			if n != v
				#return n
			end
		end
		return node
	else
		return node
	end
end

n = find_wrong(nodes[root])
n.children.each do |k, v|
	#puts "#{k}: #{v.total_weight} #{v.weight}"
end

exit
# 66057 too high
nodes.each do |k,v|
	w = nil
	v.children.each do |k, v|
		if w == nil
			w = v.total_weight
		else
			if v.total_weight != w
				p k
				p w
				p v.total_weight
			end
		end
	end
end

