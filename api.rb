#move this to environment folder

require 'httparty'
require 'byebug'



def get_words
 
  response = HTTParty.get('http://linkedin-reach.hagbpyjegb.us-west-2.elasticbeanstalk.com/words')
  # converted_response = response
  converted_response = response.parsed_response
end

words = get_words.split(" ")