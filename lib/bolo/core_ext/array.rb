class Array
  def merge
    case first
    when Array
      to_h
    when Hash
      inject(:merge)
    else
      Hash[*self]
    end
  end

  def uniqs
    group_by{|i| i }.select{|_, v| v.one? }.keys
  end

  def ununiqs
    group_by{|i| i }.reject{|_, v| v.one? }.keys
  end

  def uniq?
    (count - uniq.count).zero?
  end

  def ziph(*arr)
    [self, arr].transpose.to_h
  end
end
