# frozen_string_literal: true

class ArticleDecorator < ApplicationDecorator
  delegate_all

  def main_image
    !!object.photo ? object.photo : object.images.any? ? object.images.first.image_url : ''
  end
end
