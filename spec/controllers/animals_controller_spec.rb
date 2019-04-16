# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AnimalsController, type: :controller do
  it 'has a valid factories' do
    expect(FactoryBot.create(:dog)).to be_valid
    expect(FactoryBot.create(:cat)).to be_valid
  end
  let(:user) { FactoryBot.create(:user) }
  let(:dog) { FactoryBot.create(:dog) }
  subject { animal }

  describe 'GET #index' do
    before :each do
      get :index
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'populates an array of animals' do
      expect(assigns(:animals)).to eq([dog])
    end

    it 'renders the :index view' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    before :each do
      get :show, params: { id: dog.id }
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'assigns the requested dog to @animal' do
      expect(assigns(:animal)).to eq(dog)
    end

    it 'renders the :show view' do
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #new' do
    context 'with signed in user' do
      before :each do
        sign_in user
      end
      it 'returns http success' do
        get :new
        expect(response).to have_http_status(:success)
      end

      it 'renders the :new view' do
        get :new
        expect(response).to render_template(:new)
      end
    end
    context 'with non-signed in user' do
      it 'prevents render the :new view' do
        get :new
        expect(flash[:alert]).to eq 'You are not authorized to perform this action.'
      end
      it 'returns http found' do
        get :new
        expect(response).to have_http_status(:found)
      end
    end
  end

  describe 'POST #create' do
    before :each do
      sign_in user
    end
    context 'with valid attributes' do
      it 'create new animal' do
        expect do
          post :create, params: { animal: {
            type: 'Dog',
            name: 'Mr. Dog',
            photo: 'picture.png',
            gender: 'male',
            size: 'small',
            breed: 'pug',
            purpose: 'pet',
            for_kids: true,
            age: '12',
            general_info: 'Very nice dog',
            come_date: 2.days.ago,
            vaccination_date: 2.days.ago,
            sterilization_date: nil
          } }
        end .to change { Animal.count }.by(1)
      end

      it 'redirects to the new animal' do
        post :create, params: { animal: {
          type: 'Dog',
          name: 'Mr. Dog',
          photo: 'picture.png',
          gender: 'male',
          size: 'small',
          breed: 'pug',
          purpose: 'pet',
          for_kids: true,
          age: '12',
          general_info: 'Very nice dog',
          come_date: 2.days.ago,
          vaccination_date: 2.days.ago,
          sterilization_date: nil
        } }
        expect(response).to redirect_to animals_path
      end
    end

    context 'with invalid attributes' do
      it 'create new article' do
        expect do
          post :create, params: { animal: {
            type: nil,
            name: nil,
            photo: nil,
            gender: nil,
            size: nil,
            purpose: nil,
            for_kids: nil,
            age: '59',
            general_info: nil,
            come_date: nil,
            vaccination_date: nil,
            sterilization_date: nil
          } }
        end .to_not change { Animal.count }
      end

      it 're-renders the new method' do
        post :create, params: { animal: {
          type: nil,
          name: nil,
          photo: nil,
          gender: nil,
          size: nil,
          purpose: nil,
          for_kids: nil,
          age: '59',
          general_info: nil,
          come_date: nil,
          vaccination_date: nil,
          sterilization_date: nil
        } }
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #edit' do
    context 'with signed in user' do
      before :each do
        sign_in user
        get :edit, params: { id: dog.id }
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'assigns the requested animal to @animal' do
        expect(assigns(:animal)).to eq(dog)
      end

      it 'renders the :edit view' do
        expect(response).to render_template(:edit)
      end
    end
    context 'with non-signed in user' do
      before :each do
        get :edit, params: { id: dog.id }
      end

      it 'returns http found' do
        expect(response).to have_http_status(:found)
      end

      it 'assigns the requested article to @animal' do
        expect(assigns(:animal)).to eq(dog)
      end

      it 'prevents render the :edit view' do
        expect(flash[:alert]).to eq 'You are not authorized to perform this action.'
      end
    end
  end

  describe 'PUT #update' do
    before :each do
      sign_in user
      @animal = FactoryBot.create(:dog)
    end

    context 'with valid attributes' do
      it 'located the requested @animal' do
        put :update, params: { id: @animal.id, animal: {
          type: 'Dog',
          name: 'Mr. Cat',
          photo: 'cat_picture.png',
          gender: 'female',
          size: 'big',
          breed: 'unknown',
          purpose: 'Catch mice',
          titlefor_kids: false,
          age: 1,
          general_info: 'Very nice cat',
          come_date: 3.days.ago,
          vaccination_date: 3.days.ago,
          sterilization_date: 3.days.ago
        } }
        expect(assigns(:animal)).to eq(@animal)
      end

      it "changes @aanimal's attributes" do
        put :update, params: { id: @animal.id, animal: {
          type: 'Dog',
          name: 'Mr. Cat',
          photo: 'cat_picture.png',
          gender: 'female',
          size: 'big',
          breed: 'unknown',
          purpose: 'Catch mice',
          for_kids: false,
          age: 1,
          general_info: 'Very nice cat',
          come_date: 3.days.ago.to_date,
          vaccination_date: 3.days.ago.to_date,
          sterilization_date: 3.days.ago.to_date
        } }
        @animal.reload
        expect(@animal.type).to eq('Dog')
        expect(@animal.name).to eq('Mr. Cat')
        expect(@animal.photo).to eq('cat_picture.png')
        expect(@animal.gender).to eq('female')
        expect(@animal.size).to eq('big')
        expect(@animal.breed).to eq('unknown')
        expect(@animal.purpose).to eq('Catch mice')
        expect(@animal.for_kids).to eq(false)
        expect(@animal.age).to eq(1)
        expect(@animal.general_info).to eq('Very nice cat')
        expect(@animal.vaccination_date).to eq(3.days.ago.to_date)
        expect(@animal.sterilization_date).to eq(3.days.ago.to_date)
        expect(@animal.come_date).to eq(3.days.ago.to_date)
      end

      it 'redirects to the updated animal' do
        put :update, params: { id: @animal.id, animal: {
          type: 'Dog',
          name: 'Mr. Cat',
          photo: 'cat_picture.png',
          gender: 'female',
          size: 'big',
          breed: 'unknown',
          purpose: 'Catch mice',
          for_kids: false,
          age: 1,
          general_info: 'Very nice cat',
          come_date: 3.days.ago.to_date,
          vaccination_date: 3.days.ago.to_date,
          sterilization_date: 3.days.ago.to_date
        } }
        expect(response).to redirect_to animal_path
      end
    end

    context 'with invalid attributes' do
      it "does not change @animal's attributes" do
        put :update, params: { id: @animal.id, animal: {
          type: 'frog',
          name: 'o',
          photo: 'photo.pdf',
          gender: nil,
          size: nil,
          breed: nil,
          purpose: nil,
          for_kids: 'maybe',
          age: '59',
          general_info: nil,
          come_date: nil,
          vaccination_date: nil,
          sterilization_date: nil
        } }
        expect(@animal.type).to_not eq('frog')
        expect(@animal.name).to_not eq('o')
        expect(@animal.photo).to_not eq('photo.pdf')
        expect(@animal.gender).to_not eq(nil)
        expect(@animal.size).to_not eq(nil)
        expect(@animal.breed).to_not eq(nil)
        expect(@animal.purpose).to_not eq(nil)
        expect(@animal.for_kids).to_not eq('maybe')
        expect(@animal.age).to_not eq(59)
        expect(@animal.general_info).to_not eq(nil)
        expect(@animal.vaccination_date).to_not eq(nil)
        expect(@animal.sterilization_date).to_not eq('unknown')
        expect(@animal.come_date).to_not eq(nil)
      end

      it 're-renders the edit method' do
        put :update, params: { id: @animal.id, animal: {
          type: 'frog',
          name: 'o',
          photo: 'photo.pdf',
          gender: nil,
          size: nil,
          breed: nil,
          purpose: nil,
          for_kids: 'maybe',
          age: '59',
          general_info: nil,
          come_date: nil,
          vaccination_date: nil,
          sterilization_date: nil
        } }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'with signed in user' do
      before :each do
        sign_in user
        @animal = FactoryBot.create(:cat)
      end

      it 'deletes the animal' do
        expect do
          delete :destroy, params: { id: @animal.id }
        end.to change { Animal.count }.by(-1)
      end

      it 'redirects to animals#index' do
        delete :destroy, params: { id: @animal.id }
        expect(response).to redirect_to animals_path
      end
    end

    context 'with non-signed in user' do
      before :each do
        @animal = FactoryBot.create(:cat)
      end

      it 'prevents deleting the animal' do
        expect do
          delete :destroy, params: { id: @animal.id }
        end.to_not change { Animal.count }
      end

      it 'renders flash' do
        delete :destroy, params: { id: @animal.id }
        expect(flash[:alert]).to eq 'You are not authorized to perform this action.'
      end
    end
  end
end
