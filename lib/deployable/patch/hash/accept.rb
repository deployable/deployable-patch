class Hash
  # Return a hash that includes only the given keys. This is useful for
  # discarding everything but a few known toggles:
  #
  #    {:a => 1, :b => 2}.accept(:a)  # => {:a => 1}
  #

  # 
  def accept(*key_list)
    r = self.class.new
    key_list.each{ |key| 
      begin
        r[key] = fetch(key)
      rescue KeyError

      end
    }
    r

    # Slower
    #dup.accept!(*key_list)
  end

  # Removes any keys not given from the hash.
  #
  #    @hash.accept! :one, :two

  def accept!(*key_list)
    intersection = keys - key_list
    intersection.each{ |key| delete(key) }
    self
  end
end