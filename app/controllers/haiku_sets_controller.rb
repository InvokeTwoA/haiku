class HaikuSetsController < ApplicationController

  # :id = "15-2-32" のような形式
  def show
    id_list = params[:id]
    res = id_list.split('-')
    @word1 = Word.find res[0]
    @word2 = Word.find res[1]
    @word3 = Word.find res[2]

    haiku_sets = HaikuSet.where(word1: @word1.id, word2: @word2.id, word3: @word3.id)
    if haiku_sets.present?
      @haiku_set = haiku_sets.first
      @haiku_set.pv_up
    else
      Rails.logger.info "haiku_set create"
      @haiku_set = HaikuSet.new(
        word1: @word1.id,
        word2: @word2.id,
        word3: @word3.id,
        pv: 1
      )
      @haiku_set.generate_hash
      @haiku_set.save!
    end
  end

end
