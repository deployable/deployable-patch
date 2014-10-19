# Monkeypatch in some methods to remove class setup boilerplate

require './lib/patch/instance_class_variables'
require './lib/parse_formatted'

# Some methods to make meta definitions easier
class Object

  # The hidden singleton lurks behind everyone
  def metaclass; class << self; self; end; end
  def meta_eval &blk; metaclass.instance_eval( &blk ); end

  # Adds methods to a metaclass
  def meta_def( name, &blk )
    meta_eval { define_method name, &blk }
  end

  # Defines an instance method within a class
  def class_def( name, &blk )
    class_eval { define_method name, &blk }
  end

end


# The attribute formatter stuff
# It's a mess! first implementation

class Module

  # `sprintf` formatted readers
  # `<name>_format` to set the format
  def attr_formats options = {}

    # Create a class list of the format variables
    arr  = __ivs '_formats', []
    vars = options.keys #.map(&:to_s)
    arr.push( *vars )

    # Override new, so the class formats are picked 
    # up into the instance
    class << self

      alias_method :__new_before_format, :new
      def new(*args)
        e = __new_before_format(*args)

        # Loop through each _format var
        self.send( :__ivg, '_formats' ).each do |name|
          name_fmt_var = "#{name}_format"
          # Get the class variable
          cv = self.send( :__ivg, name_fmt_var )
          # Set the instances variable
          e.send( "#{name_fmt_var}=", cv )
        end
        e
      end

    end

    # Loop over the formats and create the 
    # class variables and accessor methods
    options.each do |name, val|

      # This sets a class variable
      # Class instance needs to pick these up
      # on intitialisation
      name_fmt_var = "#{name}_format"
      
      
      # Define the `name` accessors
      send(:define_method, name ) do

        # Lookup the formats required vars
        named_groups = __ivg(name)
        raise "no named groups set for [#{name}]" if named_groups.nil?

        # Build a hash of the format variables
        hash_of_named = Hash[ named_groups.map{|var| [var.to_sym, send(var)] } ]

        # Then supply them with the format to sprintf
        sprintf __ivg(name_fmt_var), hash_of_named
      end


      # Define the `name_format=` setter
      send(:define_method, "#{name_fmt_var}=" ) do |format|

        # Lookup the named vars from the format and store the array
        __ivs( name, format.named_groups )

        # Store the format
        __ivs( name_fmt_var, format)
      end


      # Define the `name_format` accessor
      send(:define_method, name_fmt_var ) do 
        __ivg(name_fmt_var)
      end

      # Set the class instance default variable
      # This is looked up on initialize
      __ivs( name_fmt_var, val)

    end

  end

end