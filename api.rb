#move this to environment folder

require 'httparty'
require 'byebug'

byebug


def get_words
 
  response = HTTParty.get('http://linkedin-reach.hagbpyjegb.us-west-2.elasticbeanstalk.com/words')
  # converted_response = response

end

get_words.split('\\')