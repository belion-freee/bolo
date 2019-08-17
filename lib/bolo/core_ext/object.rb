class Object
  def inv(name = nil, val = nil)
    if val
      instance_variable_set(name, val)
    elsif name
      instance_variable_get(name)
    else
      instance_variables
    end
  end

  alias_method :inv?, :instance_variable_defined?
end
