class Admin::WordsController < ApplicationController
  before_filter :authenticate
  layout 'admin'

  def index
    @words = Word.all

  end

  def destroy
    word = Word.find params[:id]
    word.destroy

    redirect_to :back
  end

  protected
  def authenticate
    authenticate_or_request_with_http_basic('Administration') do |username, password|
      username == 'ike' && password == 'men'
    end
  end

end
