class HomeController < ApplicationController
  def index
    latest
  end

  def about

  end

  def contact

  end

  def latest
    id = Article.order(:created_at).last.id if Article.order(:created_at).last
    redirect_to controller: :articles, action: :show, id: id if id
    redirect_to controller: :error, action: :index unless id
  end

  def oldest
    id = Article.order(:created_at).first.id if Article.order(:created_at).first
    redirect_to controller: :articles, action: :show, id: id if id
    redirect_to controller: :error, action: :index unless id
  end
end
