# Monkeypatch in some methods to remove class setup boilerplate
class Module

  # Provide accessors with a hash of defaults, and a default alias
  def attr_accessor_default options = {}
    options.each do |key, val|
      attr_accessor key unless instance_variable_defined? "@#{key}"
      instance_variable_set "@#{key}", val
    end
  end
  alias_method :attr_default, :attr_accessor_default

  # Provide readers with a hash of defaults
  def attr_reader_default options = {}
    options.each do |key, val|
      attr_reader key unless instance_variable_defined? "@#{key}"
      instance_variable_set "@#{key}", val
    end
  end

  # Provide writers with a hash of defaults
  def attr_writer_default options = {}
    options.each do |key, val|
      attr_writer key unless instance_variable_defined?  "@#{key}"
      instance_variable_set "@#{key}", val
    end
  end

  def attr_initialize method = nil
    # Create an `initialize` settings all the defaults
    # Allow another constructor to run `attr_initialize :some_method`
    # Would like to make this invisiable to initialize but
    # haven't come up with a cood way yet. 
    
    raise 'initialize already defined 'if method_defined? :initialize

    define_method :initialize do |options|
      options_left = options.delete_if do |key, val|
        instance_variable_defined? "@#{key}" or instance_variable_set "@#{key}", val
      end
      send method, options_left
    end

  end

end
