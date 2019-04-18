# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'renders the :new view' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'send new message' do
        post :create, params: { message: {
          name: 'John Rambo',
          email: 'john@example.com',
          phone_number: '123123123',
          body: 'Lorem ipsum'
        } }

        expect(flash[:notice]).to eq 'Dziękujemy za Twoją wiadomość, odezwiemy się najszybciej jak to możliwe.'
      end
    end

    context 'with invalid attributes' do
      it 'shows errors' do
        post :create, params: { message: {
          name: nil,
          email: 'john@example',
          phone_number: 'number',
          body: nil
        } }

        expect(flash[:notice]).to eq 'Nie udało się wysłać wiadomości. Sprawdź błędy i spróbuj ponownie.'
      end
      it 're-render contact form' do
        post :create, params: { message: {
          name: nil,
          email: 'john@example',
          phone_number: 'number',
          body: nil
        } }

        expect(response).to render_template :new
      end
    end
  end
end
