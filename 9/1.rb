#!/usr/bin/ruby

def filter_garbage(l)
  nl = ""
  garbage = 0
  ignore_next = false
  l.split("").each do |c|
    if ignore_next
      ignore_next = false
    elsif c == "!" and garbage > 0
      ignore_next = true
    elsif c == "<" and garbage == 0
      garbage += 1
    elsif c == ">"
      garbage -= 1
    else
      if garbage == 0
        nl += c
      end
    end
    raise if garbage < 0
  end
  raise if garbage != 0
  return nl
end

def handle(l)
  l = filter_garbage(l)
  score = 0
  ngroup = 0
  l.split("").each do |c|
    if c == "{"
      ngroup += 1
    elsif c == "}"
      score += ngroup
      ngroup -= 1
    end
  end
  raise if ngroup != 0
  p l
  p score
end


File.read(ARGV[0]).split("\n").each do |l|
  handle(l)
end

