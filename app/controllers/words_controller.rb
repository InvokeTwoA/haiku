class WordsController < ApplicationController
  def index
    #@words = Word.all
    word5_list = Word.text5.pluck(:id)
    word7_list = Word.text7.pluck(:id)

    @id_lists = []
    while true do
      break if word5_list.count <= 1 || word7_list.count <= 0
      res = []

      text5 = word5_list.sample(2)
      word5_list.delete text5.first
      word5_list.delete text5.last

      res.push text5.first
      res.push word7_list.sample(1).first
      word7_list.delete res.last

      res.push text5.last
      @id_lists.push res
    end

    @word = Word.new
  end

  def create
    @word = Word.create(word_params)
    redirect_to root_path
  end

  def word_params
    params.require(:word).permit(:text, :avatar, :number)
  end
end
