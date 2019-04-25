# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AdoptionsController, type: :controller do
  let(:dog) { FactoryBot.create(:dog) }

  describe 'GET #new' do
    before :each do
      get :new, params: { animal_id: dog.id }
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'assigns the requested dog to @animal' do
      expect(assigns(:animal)).to eq(dog)
    end

    it 'renders the :adoption view' do
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'send new message' do
        @animal = dog
        post :create, params: { animal_id: dog.id, dog_adoption: {
          name: 'John Rambo',
          email: 'john@example.com',
          phone_number: '123123123',
          where_keep: 'Home',
          free_time: 'Running',
          children_age: '10 - 12',
          other_animals: 'no',
          had_dog: 'yes',
          hours_alone: '8',
          comments: 'I really like dogs',
          dog_name: 'Fafik'
        } }

        expect(flash[:notice]).to eq 'Dziękujemy za Twoją wiadomość, odezwiemy się najszybciej jak to możliwe.'
      end
    end
    context 'with invalid attributes' do
      it 'prevents sending new message' do
        @animal = dog
        post :create, params: { animal_id: dog.id, dog_adoption: {
          name: nil,
          email: 'john@com',
          phone_number: 'no phone',
          where_keep: nil,
          free_time: nil,
          children_age: nil,
          other_animals: nil,
          had_dog: nil,
          hours_alone: nil,
          comments: nil,
          dog_name: nil
        } }

        expect(flash[:notice]).to eq 'Nie udało się przesłać formularza. Sprawdź błędy i spróbuj ponownie.'
      end
    end
  end
end
