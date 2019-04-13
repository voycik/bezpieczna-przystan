class DogsController < AnimalsController
  def index
    @dogs = Dog.all
  end

  def new
  @animal = Dog.new
  end

  def create
    @animal = Dog.new(animal_params(:dog))
    if @animal.save
      flash[:success] = "Pomyślnie dodano nowego psa."
      redirect_to animals_path
    else
      flash.now[:danger] = "Nie udało się dodać nowego psa. Sprawdź błędy i spróbuj ponownie."
      render :new
    end
  end

end
