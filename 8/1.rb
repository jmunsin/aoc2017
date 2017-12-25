#!/usr/bin/ruby

class Env
  attr_accessor :vars
  def initialize
    @vars = Hash.new(0)
    @instr = []
  end
  def add_instr(i)
    @instr << i
  end
  def evaluate()
    @instr.each do |i|
      if i.eval_cond(self)
        i.eval_cmd(self)
      end
    end
  end
  def largest
    l = 0
    @vars.each do |k, v|
      if v > l
        l = v
      end
    end
    return l
  end
end

class Instr
  def initialize(target, op, amount, cmp_target, cmp_op, cmp_amount)
    @target = target
    @op = op
    @amount = amount
    @cmp_target = cmp_target
    @cmp_op = cmp_op
    @cmp_amount = cmp_amount
  end
  def eval_cond(env)
    if eval("#{env.vars[@cmp_target]} #{@cmp_op} #{@cmp_amount}")
      return true
    else
      return false
    end
  end
  def eval_cmd(env)
    if @op == "inc"
      env.vars[@target] += @amount
    elsif @op == "dec"
      env.vars[@target] -= @amount
    else
      raise @op
    end
  end
end

env = Env.new
File.read(ARGV[0]).split("\n").each do |l|
  if l =~ /^(\w+) (inc|dec) (\S+) (\w+) (\w+) (\S+) (\S+)$/
    i = Instr.new($1, $2, $3.to_i, $5, $6, $7.to_i)
    env.add_instr(i)
  else
    raise l
  end
end

env.evaluate

p env.largest
