#move this to environment folder

require 'httparty'
require 'byebug'

#method for computer to collect words
def get_words
  response = HTTParty.get('http://linkedin-reach.hagbpyjegb.us-west-2.elasticbeanstalk.com/words')
  converted_response = response.parsed_response
end


#Later: Create hash with words as keys and values including the optional parameters: difficulty, minilength, maxlenght,start, count (review structure later)





#Step 1: computer randomly choosing a word
words = get_words.split(" ")

p "Hello! How long should the word you're guessing be?"
length = gets.chomp().to_i
"Pick your game level from 1-10:"

difficulty = gets.chomp().to_i

def pick_a_word(length)
  #remove sandwich code and change into map after it gets working
  words = get_words.split(" ")
  filtered_wrds_by_length = []
  
  words.each do |wrd| #or select method
    if wrd.size == length.to_i
      filtered_wrds_by_length << wrd
    end
  end

  chosen_word = filtered_wrds_by_length.sample

end
chosen_word = pick_a_word(length)




#Rules
# User can keep guessing until they run out of guesses / (game_time loop will keep running until user reaches 6 guesses
byebug


def game_time(chosen_word)
  guesses = 6
  incorrect_guesses = []
  blanks = "_" * chosen_word.length 

  until guesses == 0 || !blanks.include?("_")
    p blanks
    p "Give me a letter:"
    letter = gets.chomp()

    if chosen_word.include?(letter)
      chosen_word.each_char.with_index do |char, idx|
        if char == letter
            blanks[idx] = letter
       
        end
      end

    else
      incorrect_guesses << letter
      guesses -=1
      p "You have #{guesses} guesses left. Try again!  |   Incorrect guesses: #{incorrect_guesses.join(",")}" unless guesses == 0

    
    

    end
  end

  if guesses == 0 #or guesses variable 
   p "You lost. The word is '#{chosen_word}'"#.Want to play again? y/n"#insert "Want to play again?"
  
      
  elsif  !blanks.include?("_")
   p "Good job!" #insert "Want to play again?"
  end
end
p "hola!"





