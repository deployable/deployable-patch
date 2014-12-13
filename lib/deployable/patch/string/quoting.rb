class String

  def quote char
    # improve this to escape chars, if they aren't already escaped
    raise if match char
    "#{char}#{self}#{char}"
  end

  def quote_escape char
    #if m = match char
    #  m.
    #end
    "#{char}#{self}#{char}"
  end

  def single_quote
    quote "'"
  end

  def double_quote
    quote '"'
  end

  def needs_quoting? check = /\s/
    !!match(check)
  end

end