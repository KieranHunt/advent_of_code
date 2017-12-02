Dir
  .entries(Dir.current)
  .select(&.=~(/[0-9]*[a|b]\.cr/))
  .each { |filename| `crystal build #{filename}` }
