#!/usr/bin/ruby

def filter_garbage(l)
  nl = ""
  garbage = 0
  ignore_next = false
  removed = 0
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
      else
        removed += 1
      end
    end
    raise if garbage < 0
  end
  raise if garbage != 0
  return removed
end

def handle(l)
  removed = filter_garbage(l)
  p removed
end


File.read(ARGV[0]).split("\n").each do |l|
  handle(l)
end

