class HomeController < ApplicationController
  def index
    latest
  end

  def about

  end

  def contact

  end

  def latest
    id = Article.order(:created).first.id
    redirect_to controller: :articles, action: :show, id: id
  end

  def oldest
    id = Article.order(:created).last.id
    redirect_to controller: :articles, action: :show, id: id
  end
end
