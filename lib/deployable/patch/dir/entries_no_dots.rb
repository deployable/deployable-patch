require "deployable/patch/version"

module Dir
  DOT_ENTRIES = [ '.', '..' ]

  def self.entries_no_dots dir
    self.entries( dir ).remove_dot_entries
  end

  def self.remove_dots arg
    arg.delete_if{|e| 
      DOT_ENTRIES.any?{ |d| e == d }
    }
  end
end

module Array
  def remove_dot_entries
    self - Dir::DOT_ENTRIES
  end
end
