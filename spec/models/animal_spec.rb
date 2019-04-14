# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Animal, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.create(:dog)).to be_valid
    expect(FactoryBot.create(:cat)).to be_valid
  end

  let(:dog) { FactoryBot.create(:dog) }
  subject { dog }

  describe 'database columns' do
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :type }
    it { is_expected.to have_db_column :gender }
    it { is_expected.to have_db_column :size }
    it { is_expected.to have_db_column :purpose }
    it { is_expected.to have_db_column :for_kids }
    it { is_expected.to have_db_column :age }
    it { is_expected.to have_db_column :photo }
    it { is_expected.to have_db_column :general_info }
    it { is_expected.to have_db_column :come_date }
    it { is_expected.to have_db_column :vaccination_date }
    it { is_expected.to have_db_column :sterilization_date }
    it { is_expected.to have_db_column :breed }
  end

  describe 'validations' do
    it { expect(subject).to validate_presence_of(:name) }
    it { expect(subject).to validate_presence_of(:gender) }
    it { expect(subject).to validate_presence_of(:size) }
    it { expect(subject).to validate_presence_of(:purpose) }
    it { expect(subject).to validate_presence_of(:age) }
    it { expect(subject).to validate_presence_of(:come_date) }
    it { expect(subject).to validate_presence_of(:breed) }
    it { expect(subject).to validate_length_of(:name).is_at_least(2) }
    it { expect(subject).to validate_length_of(:name).is_at_most(30) }
    it { expect(subject).to validate_length_of(:general_info).is_at_most(1000) }
    it { expect(subject).to validate_inclusion_of(:for_kids).in_array([true, false]) }
    it { expect(subject).to validate_numericality_of(:age).is_less_than_or_equal_to(30) }
    it { expect(subject).to validate_numericality_of(:age).only_integer }
  end
end
