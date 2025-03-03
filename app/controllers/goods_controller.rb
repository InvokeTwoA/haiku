class GoodsController < ApplicationController

  def index
    @id_lists = []
    Good.order("value desc").each do  |good|
      res = []
      res.push good.word1
      res.push good.word2
      res.push good.word3
      @id_lists.push res
    end
    @word = Word.new
  end

  # いいね
  def yes
    id_list = params[:id]
    res = id_list.split('-')
    goods = Good.where(
      word1: res[0],
      word2: res[1],
      word3: res[2]
    )
    if goods.present?
      good = goods.first
      good.value = good.value + 1
      good.save!
      true
    else
      good = Good.create!(
        user_id: 1,
        value: 1,
        created_at: Time.now,
        word1: res[0],
        word2: res[1],
        word3: res[2]
      )
      true
    end
    head :ok
  end

  def tanka_yes
    id_list = params[:id]
    res = id_list.split('-')
    goods = TankaGood.where(
      word1: res[0],
      word2: res[1],
      word3: res[2],
      word3: res[3],
      word3: res[4]
    )
    if goods.present?
      good = goods.first
      good.value = good.value + 1
      good.save!
      true
    else
      good = TankaGood.create!(
        user_id: 1,
        value: 1,
        created_at: Time.now,
        word1: res[0],
        word2: res[1],
        word3: res[2],
        word4: res[3],
        word5: res[4],
      )
      true
    end
    head :ok

  end
end
