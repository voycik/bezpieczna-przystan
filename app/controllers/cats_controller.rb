# frozen_string_literal: true

class CatsController < AnimalsController
  def index
    @cats = Cat.all
  end

  def new
    @animal = Cat.new
  end

  def create
    @animal = Cat.new(animal_params(:cat))
    if @animal.save
      flash[:success] = 'Pomyślnie dodano nowego kota.'
      redirect_to animals_path
    else
      flash.now[:danger] = 'Nie udało się dodać nowego kota. Sprawdź błędy i spróbuj ponownie.'
      render :new
    end
  end
end
