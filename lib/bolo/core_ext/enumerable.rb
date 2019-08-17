module Enumerable
  def maps(op, *args)
    map { |r| op.to_sym.to_proc[r, *args] }
  end
end
