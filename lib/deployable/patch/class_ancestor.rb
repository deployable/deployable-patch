
class Class
  # Remove the modules from the classes
  def ancestor_classes
    ancestors - included_modules
  end

  # Parent class, first ancestor
  def ancestor_class
    list = ancestor_classes
    self if list.length == 0
    ancestor_classes[1]
  end
end
