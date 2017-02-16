#move this to environment folder

require 'httparty'
require 'byebug'


def get_words
  response = HTTParty.get('http://linkedin-reach.hagbpyjegb.us-west-2.elasticbeanstalk.com/words')
  # converted_response = response
  converted_response = response.parsed_response
end

#Ideally: 
#Create hash with words as keys and values including the optional parameters: difficulty, minilength, maxlenght,start, count (review structure later)

#For now, get basics working by:
#Step 1: computer collecting words
words = get_words.split(" ")

# def start_game
p "Hello! How long should the word you're guessing be?"
length = gets.chomp().to_i
"Pick your game level from 1-10:"

difficulty = gets.chomp().to_i
# end

def pick_a_word(length)
  #remove sandwich code and change into map after it gets working
  words = get_words.split(" ")
  filtered_wrds_by_length = []
  
  words.each do |wrd|
    if wrd.size == length.to_i
      filtered_wrds_by_length << wrd
    end
  end

  chosen_word = filtered_wrds_by_length.sample

end
chosen_word = pick_a_word(length)




#Rules
# User can keep guessing until they reach the number of strikes
# strikes may be provided at the start of the game. in that case, 
# change 5 into the strikes variable based on difficulty chosen by user 
# in the beginning


def game_time(chosen_word)
  strikes = 0
  blanks = "X" * chosen_word.length 

  until strikes == 5 #|| !blanks.include?("X")
    p "Give me a letter:"
    letter = gets.chomp()

    if chosen_word.include?(letter)
      chosen_word.each_char.with_index do |char, idx|
        if char == letter
            blanks[idx] = letter
            p blanks
        end
      end

    else
      byebug
      strikes +=1
      p "Nope, try again."
     
    end
  end

  if strikes == 5 #or strikes variable 
   p "You lost. The word is #{chosen_word}"#.Want to play again? y/n"#insert "Want to play again?"
    # play_again = gets.chomp()
    # if play_again == "y" ||play_again == "Y" 
      
    # end
  elsif  !blanks.include?("X")
   p "Good job!" #insert "Want to play again?"
  end
end


p "hola!"





