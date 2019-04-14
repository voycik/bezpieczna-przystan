# frozen_string_literal: true

class AnimalsController < ApplicationController
  before_action :find_animal, only: %i[show edit destroy]
  def index
    @animals = Animal.all
  end

  def show; end

  def edit; end

  def update; end

  def destroy; end

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
