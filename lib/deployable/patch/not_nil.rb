# This can make not nil checks look nicer depending on the objects
class Object
  def not_nil?
    !nil?
  end
end