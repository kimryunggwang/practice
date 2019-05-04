class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end
  attr_accessor :word,:guesses, :wrong_guesses
  def initialize(word)
    @word = word
    @guesses=""
    @wrong_guesses=""
  end

def guess(letter)
  raise ArgumentError if letter.nil?||letter==" "||letter.length!=1||letter=~ /[A-z]/
  letter.downcase!
  if guess.include?(letter)
    return false
  elsif word.include?(letter)
    guesses+=letter
  else
    wrong_guesses+=letter
  end
  return true    



end


def word_with_guesses
result =""
word.length.times{result+="-"}
for i in 0...word.length
  result[i]= word[i]if guesses.include?(word[i])
end
result
end



end

def check_win_or_lose
  if word_with_guesses==word
    :win
    elsif wrong_guesses.length>=7
    :lose
  else
    :play

end




  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.new('watchout4snakes.com').start { |http|
      return http.post(uri, "").body
    }
  end

end
