def boss_room(input)
  if input == 'yes'
    puts "\nO_O\nWhat's that?!?!\nGoogle Hangouts Offices?!\nYou have to do something! (hang out for a bit/release the fantoms)"
    KEEP_TRACK << 'winlose'
  elsif input == 'no'
    puts "\nSomeone is chickening...! All right, back to the hall."
    back_to_main
  else
    puts INVALID
  end
end

def win_or_lose(input)
  if input == 'hang out for a bit'
    puts "\nHOW DARE YOU?\nSorry my dear but this is high treason. No one is allowed to 'hang out' with our competitors!\nYou lost."
    false
  elsif input == 'release the fantoms'
    puts "\nOMG Blinky, Inky and Pinky are eating the power cables, all the servers are shutting down and thus....\nDestroying our competitor yaaaaaay!\nYou won, well done :)"
    false
  else
    puts INVALID
    true
  end
end
