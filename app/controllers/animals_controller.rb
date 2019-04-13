class AnimalsController < ApplicationController
  before_action :find_animal, only: %i[show edit destroy]
  def index
    @animals = Animal.all
  end

  def show
  end

  def new
  @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params(animal))
    if @animal.save
      flash[:success] = "Pomyślnie dodano nowego zwierzaka."
      redirect_to animals_path
    else
      flash.now[:danger] = "Nie udało się dodać zwierzaka. Sprawdź błędy i spróbuj ponownie."
      render :new
    end
  end

  def edit
  end
  def update
  end

  def destroy
  end

  private

  def animal_params(type)
    params.require(type).permit(:name, :type, :gender, :size, :age,
      :purpose, :for_kids, :photo, :general_info, :come_date, :vaccination_date,
      :breed)
  end

  def find_animal
    @animal = Animal.find(params[:id])
  end


end
