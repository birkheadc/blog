json.extract! article, :id, :title, :sub_title, :content, :created, :edited, :language
json.url article_url(article, format: :json)
