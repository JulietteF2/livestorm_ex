# Greet player and first request prompt to pick room
def first_step(input)
  if input == 'yes'
    puts "\nGreat! I have a mission for you...  You just entered Livestorm headquarters and we need you to help us defeat our nasty neighbour but for that, you'll need to find 3 artefacts.\nWhere do you go? (right/left/forward)"
    KEEP_TRACK << 'hall'
  elsif input == 'no'
    return false
  else
    puts INVALID
  end
  true
end
