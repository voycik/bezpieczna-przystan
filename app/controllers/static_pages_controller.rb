class StaticPagesController < ApplicationController

  def welcome
    @animals = AnimalDecorator.decorate_collection(Animal.last(3))
    @article = Article.last.decorate
  end
end
