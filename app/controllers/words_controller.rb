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

  def word_params
    params.require(:word).permit(:text, :avatar, :number)
  end

  def haiku
    @res = []

    hash = params[:hash]
    urls = HaikuSet.where(token: hash)
    if urls.present?
      url = urls.first
      url.pv = url.pv + 1
      url.save!

      @res.push url.word1
      @res.push url.word2
      @res.push url.word3

      @pv = url.pv
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

      url = HaikuSet.create(
        token: SecureRandom.urlsafe_base64(6),
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
