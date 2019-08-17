class HashtagsController < ApplicationController
  def show
    tag = params[:id]
    @hashtag = Hashtag.new(tag)
  end
end
