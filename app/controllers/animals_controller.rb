# frozen_string_literal: true

class AnimalsController < ApplicationController
  before_action :find_animal, only: %i[edit update destroy]
  before_action :authorize_animal, only: %i[edit update destroy]

  def index
    @animals = AnimalDecorator.decorate_collection(Animal.all.paginate(page: params[:page], per_page: 6))
  end

  def new
    @animal = Animal.new
    authorize @animal
  end

  def create
    @animal = Animal.new(animal_params)
    authorize @animal
    if @animal.save
      flash[:success] = 'Pomyślnie dodano nowego zwierzaczka.'
      redirect_to animals_path
    else
      flash.now[:danger] = 'Nie udało się dodać nowego zwierzątka. Sprawdź błędy i spróbuj ponownie.'
      render :new
    end
  end

  def show
    @animal = Animal.find(params[:id]).decorate
  end

  def edit; end

  def update
    if @animal.update_attributes(animal_params)
      flash[:success] = 'Dane zwierzaka zaktualizowane pomyślnie'
      redirect_to animal_path
    else
      render 'edit'
    end
  end

  def destroy
    @animal.destroy
    flash[:success] = 'Zwierzątko zostało usunięte'
    redirect_to animals_path
  end

  def adoption
    @animal = Animal.find(params[:animal_id]).decorate
    @adoption = DogAdoption.new
  end

  def send_adoption_form
    @animal = Animal.find(params[:animal_id])
    @adoption = DogAdoption.new(adoption_params)
    if @adoption.valid?
      AdoptionMailer.contact(@adoption).deliver_now
      redirect_to animal_path(@animal)
      flash[:notice] = 'Dziękujemy za Twoją wiadomość, odezwiemy się najszybciej jak to możliwe.'
    else
      flash[:notice] = 'Nie udało się przesłać formularza. Sprawdź błędy i spróbuj ponownie.'
      render :adoption
    end
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :type, :gender, :size, :age,
                                   :purpose, :for_kids, :general_info, :come_date, :vaccination_date,
                                   :sterilization_date, :breed, image_data: [])
  end

  def adoption_params
    params.require(:dog_adoption).permit(:name, :email, :phone_number, :where_keep, :free_time, :children_age,
                                         :other_animals, :had_dog, :hours_alone, :dog_name, :comments)
          .merge!(dog_name: @animal.name)
  end

  def find_animal
    @animal = Animal.find(params[:id])
  end

  def authorize_animal
    authorize @animal
  end
end
