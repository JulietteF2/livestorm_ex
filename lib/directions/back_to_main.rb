# General request prompt to pick room when user goes back
def back_to_main
  puts "You're back at the entrance.\nWhere do you go? (right/left/forward)"
  KEEP_TRACK << 'hall'
end
