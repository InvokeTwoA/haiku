class TopController < ApplicationController
  def index
    @word = Word.recent.first
    @good = Good.recent.first
    @comments = Comment.recent.limit(5)

  end
end
