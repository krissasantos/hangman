Hangman
insert documentation here!




Handling invalid inputs: 
  # The code does not deduct the number of guesses if the following things happen: 
          # if guess isnt a letter from a-z
          # if guess is repeating

  The user instead tries again to give a valid input. 


      # elsif !letter.is_a?(String)
      #   p "Only letters form a-z is allowed. Try again."

      # elsif !incorrect_guesses.include?(letter)
      #   p "You already tried this letter! Pick another one."