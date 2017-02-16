#move this to environment folder

require 'httparty'
require 'byebug'

byebug

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
length = gets.chomp()

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
pick_a_word(length)

p "hola!"








