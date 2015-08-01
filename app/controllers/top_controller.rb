class TopController < ApplicationController
  def index
    @word = Word.recent.first
    @good = Good.recent.first
    @tanka_good = TankaGood.recent.first
    @comments = Comment.recent.limit(5)

    @haiku_set = create_haiku
  end

  def create_haiku
    word5_list = Word.text5.pluck(:id)
    word7_list = Word.text7.pluck(:id)
    tmp_word5 = word5_list.sample(2)
    tmp_word7 = word7_list.sample(1)

    haiku_sets = HaikuSet.where(word1: tmp_word5.first, word2: tmp_word7.first, word3: tmp_word5.last)
    if haiku_sets.present?
      return haiku_sets.first
    else
      res = []
      res.push tmp_word5.first
      res.push tmp_word7.first
      res.push tmp_word5.last

      haiku_set = HaikuSet.new(
        word1: tmp_word5.first,
        word2: tmp_word7.first,
        word3: tmp_word5.last,
        pv: 1
      )
      haiku_set.generate_hash
      haiku_set.save!
      return haiku_set
    end
  end
end
