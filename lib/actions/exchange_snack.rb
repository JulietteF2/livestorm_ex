# Filter if user exchange or not his snack with Tom
def exchange_snack(input)
  if input == 'yes'
    ARTEFACTS << 'inky'
    ARTEFACTS << 'pinky'
    puts "\nSmart move, Tom is happy! He gives you... Inky & Pinky, two little PacMan Fantoms who'll join your artefacts collection yaaay. You now have #{ARTEFACTS.count}/3 artefacts. Let's go back to the hall."
    back_to_main
  elsif input == 'no'
    puts "\nYou're not very nice... but ok, let's go back to the hall then."
    back_to_main
  else
    puts INVALID
  end
end
