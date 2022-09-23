class Blurb
  include ActiveModel::Conversion
  @title
  @sub_title
  @created

  def initialize(title, sub_title, created)
    @title = title
    @sub_title = sub_title
    @created = created
  end

  attr_reader :title, :sub_title, :created
end