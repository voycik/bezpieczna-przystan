# frozen_string_literal: true

class AdoptionsController < ApplicationController
  before_action :find_animal
  def new
    @adoption = DogAdoption.new
  end

  def create
    @adoption = DogAdoption.new(adoption_params)
    if @adoption.valid?
      AdoptionMailer.contact(@adoption).deliver_now
      redirect_to animal_path(@animal)
      flash[:notice] = 'Dziękujemy za Twoją wiadomość, odezwiemy się najszybciej jak to możliwe.'
    else
      flash[:notice] = 'Nie udało się przesłać formularza. Sprawdź błędy i spróbuj ponownie.'
      render :new
    end
  end
end

def adoption_params
  params.require(:dog_adoption).permit(:name, :email, :phone_number, :where_keep, :free_time, :children_age,
                                       :other_animals, :had_dog, :hours_alone, :dog_name, :comments)
        .merge!(dog_name: @animal.name)
end

def find_animal
  @animal = Animal.find(params[:animal_id]).decorate
end
