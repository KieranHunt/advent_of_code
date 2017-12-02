Dir
  .entries(Dir.current)
  .select(&.=~(/[0-9]*[a|b]\.cr/))
  .map { |filename| filename[0...(filename.size - 3)] }
  .each { |filename| `rm #{filename}` }
