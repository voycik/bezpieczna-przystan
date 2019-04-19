class AnimalDecorator < ApplicationDecorator
  delegate_all

  def main_image
    !!object.photo ? object.photo : object.images.any? ? object.images.first.image_url : "https://dummyimage.com/300x200/a3a3a3/fff.jpg&text=Brak+zdj%C4%99cia"
  end
  
end
