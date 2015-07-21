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
    @word = Word.create!(word_params)
    redirect_to root_path
  rescue
    redirect_to muri_path
  end

  def show
    id_list = params[:id]
    res = id_list.split('-')
    @word1 = Word.find res[0]
    @word2 = Word.find res[1]
    @word3 = Word.find res[2]

    haiku_sets = HaikuSet.where(word1: @word1.id, word2: @word2.id, word3: @word3.id)
    if haiku_sets.present?
      haiku_set = haiku_sets.first
      haiku_set.pv_up
      @pv = haiku_set.pv
    else
      haiku_set = HaikuSet.new(
        word1: @word1.id,
        word2: @word2.id,
        word3: @word3.id,
        pv: 1
      )
      haiku_set.save!
      @pv = 1
    end
  end

  def word_params
    params.require(:word).permit(:text, :avatar, :number)
  end

  def haiku
    @res = []

    hash = params[:hash]
    haiku_sets = HaikuSet.where(token: hash)
    if haiku_sets.present?
      haiku_set = haiku_sets.first
      haiku_set.pv_up

      @res.push haiku_set.word1
      @res.push haiku_set.word2
      @res.push haiku_set.word3

      @pv = haiku_set.pv
    else
      word5_list = Word.text5.pluck(:id)
      word7_list = Word.text7.pluck(:id)
      tmp_word5 = word5_list.sample(2)
      tmp_word7 = word7_list.sample(1)

      haiku_set = HaikuSet.where(word1: tmp_word5.first, word2: tmp_word7.first, word3: tmp_word5.last)
      if haiku_set.present?
        return redirect_to "/haiku/#{haiku_set.first.token}"
      end

      @res.push tmp_word5.first
      @res.push tmp_word7.first
      @res.push tmp_word5.last

      HaikuSet.create(
        token: hash,
        word1: tmp_word5.first,
        word2: tmp_word7.first,
        word3: tmp_word5.last,
        pv: 1
      )
      @pv = 1
    end
  end

  def muri

  end
end
