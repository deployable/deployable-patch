# Easier instance variable getters that 
# do the variable naming/symbol for you
class Object

  def __ivg name
    instance_variable_get :"@#{name}" 
  end

  def __ivs name, value
    instance_variable_set :"@#{name}", value
  end

  def __class_ivg name
    self.class.__ivg name
  end

  def __class_ivs name, value
    self.class.__ivs name, value
  end

end


# Easier class variable access 
# do the variable naming/symbol for you
class Module

  def __cvg name
    class_variable_get :"@@#{name}" 
  end

  def __cvs name, value
    class_variable_set :"@@#{name}", value
  end

end