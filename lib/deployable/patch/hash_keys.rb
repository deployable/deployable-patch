
# Make testing for multiple keys easiers on a hash

class Hash
  def has_all_keys? *keys
    keys.all? do |key| has_key?(key) end
  end

  def has_any_keys? *keys
    keys.any? do |key| has_key?(key) end
  end
end
