class BlurbsController < ApplicationController
  def latest
    n = params[:n].to_i
    @blurbs = get_blurbs n
  end 

  def get_blurbs(n)
    articles = Article.order(created_at: :desc).first(n).pluck(:title, :sub_title, :created_at)
    blurbs = []
    for article in articles
      blurbs.push(Blurb.new(article[0], article[1], article[2]))
    end
    blurbs
  end
end
