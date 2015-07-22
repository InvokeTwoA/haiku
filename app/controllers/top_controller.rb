class TopController < ApplicationController
  def index
    @good = Good.recent.first
    @comments = Comment.recent.limit(5)

  end
end
