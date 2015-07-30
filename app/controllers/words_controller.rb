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

  def rnd
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
    render "words/index"
  end

  def popular
    @id_lists = []
    HaikuSet.popular.each do |haiku_set|
      res = []
      res.push haiku_set.word1
      res.push haiku_set.word2
      res.push haiku_set.word3
      @id_lists.push res
    end
    @word = Word.new
  end

  def new
    @word = Word.new

  end

  def create
    @word = Word.create!(word_params)
    redirect_to :back, notice: '画像を追加しました。'
  rescue
    redirect_to muri_path
  end

  def show
    @word = Word.find params[:id]
    if @word.number == 7
      @haiku_sets = HaikuSet.where("word2 = ?", @word.id)
    else 
      @haiku_sets = HaikuSet.where("word1 = ? OR word3 = ?", @word.id, @word.id)
    end
  end

  def word_params
    params.require(:word).permit(:text, :avatar, :number)
  end

  def haiku
    @res = []
    token = params[:hash]
    haiku_sets = HaikuSet.where(token: token)
    if haiku_sets.present?
      @haiku_set = haiku_sets.first
      @haiku_set.pv_up

      @res = @haiku_set.id_list
    else
      word5_list = Word.text5.pluck(:id)
      word7_list = Word.text7.pluck(:id)
      tmp_word5 = word5_list.sample(2)
      tmp_word7 = word7_list.sample(1)

      haiku_sets = HaikuSet.where(word1: tmp_word5.first, word2: tmp_word7.first, word3: tmp_word5.last)
      if haiku_sets.present?
        return redirect_to "/haiku/#{haiku_sets.first.token}"
      end

      @res.push tmp_word5.first
      @res.push tmp_word7.first
      @res.push tmp_word5.last

      @haiku_set = HaikuSet.new(
        token: token,
        word1: tmp_word5.first,
        word2: tmp_word7.first,
        word3: tmp_word5.last,
        pv: 1
      )
      @haiku_set.save!
    end
  end

  def tanka
    @res = []
    token = params[:hash]
    tanka_sets = TankaSet.where(token: token)
    if tanka_sets.present?
      @tanka_set = tanka_sets.first
      @tanka_set.pv_up

      @res = @tanka_set.id_list
    else
      word5_list = Word.text5.pluck(:id)
      word7_list = Word.text7.pluck(:id)
      tmp_word5 = word5_list.sample(2)
      tmp_word7 = word7_list.sample(3)

      tanka_sets = TankaSet.where(word1: tmp_word5.first, word2: tmp_word7.first, word3: tmp_word5.last, word4: tmp_word7[1], word5: tmp_word7.last)
      if tanka_sets.present?
        return redirect_to "/tanka/#{tanka_sets.first.token}"
      end
      @res.push tmp_word5.first
      @res.push tmp_word7.first
      @res.push tmp_word5.last
      @res.push tmp_word7[1]
      @res.push tmp_word7.last

      @tanka_set = TankaSet.new(
        token: token,
        word1: tmp_word5.first,
        word2: tmp_word7.first,
        word3: tmp_word5.last,
        word4: tmp_word7[1],
        word5: tmp_word7.last,
        pv: 1
      )
      @tanka_set.save!
    end
  end

  def muri

  end
end
