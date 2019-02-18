require 'open-uri'

class GamesController < ApplicationController
  VOWELS = %w(A E I O U)

  def new
    @letters = Array.new(5) { VOWELS.sample }
    @letters += Array.new(5) { (('A'..'Z').to_a - VOWELS).sample }
    @letters.shuffle!
  end

  def score
    # @letters = params[:letters].split
    @word = (params[:word] || "").upcase
    # @included = included?(@word, @letters)
    @check_word = check_word?(@word)
  end

  private



  def check_word?(word)
    response = open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end
end
