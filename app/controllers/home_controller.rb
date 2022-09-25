class HomeController < ApplicationController
  def index
    latest
  end

  def about

  end

  def contact

  end

  def latest
    id = Article.order(:created_at).last.id || nil
    redirect_to controller: :articles, action: :show, id: id
  end

  def oldest
    id = Article.order(:created_at).first.id || nil
    redirect_to controller: :articles, action: :show, id: id
  end
end
