# frozen_string_literal: true

class AnimalsController < ApplicationController
  before_action :find_animal, only: %i[show edit destroy]
  def index
    @animals = Animal.all
  end
  
  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    if @animal.save
      flash[:success] = 'Pomyślnie dodano nowego zwierzaczka.'
      redirect_to animals_path
    else
      flash.now[:danger] = 'Nie udało się dodać nowego zwierzątka. Sprawdź błędy i spróbuj ponownie.'
      render :new
    end
  end

  def show; end

  def edit; end

  def update; end

  def destroy; end

  private

  def animal_params
    params.require(:animal).permit(:name, :type, :gender, :size, :age,
                                :purpose, :for_kids, :photo, :general_info, :come_date, :vaccination_date,
                                :sterilization_date, :breed)
  end

  def find_animal
    @animal = Animal.find(params[:id])
  end
end
