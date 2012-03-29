class HeadlinesController < ApplicationController
  def index
    @headlines = Headline.all
  end
end