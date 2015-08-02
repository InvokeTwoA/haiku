class Admin::WordsController < ApplicationController
  before_filter :authenticate
  layout 'admin'

  def index
    @words = Word.all
  end

  def edit
    @word = Word.find params[:id]
  end

  def update
    @word = Word.find params[:id]
    @word.update_attributes(word_params)
    redirect_to :back, notice: '画像を編集しました。'
  end

  def destroy
    word = Word.find params[:id]
    word.destroy

    redirect_to :back
  end

  def permit
    word = Word.find params[:id]
    word.permit_flag = true
    word.save!
    redirect_to :back
  end

  protected
  def authenticate
    authenticate_or_request_with_http_basic('Administration') do |username, password|
      username == 'ike' && password == 'men'
    end
  end

  def word_params
    params.require(:word).permit(:text, :avatar, :number)
  end

end
