# frozen_string_literal: true

require 'rails_helper'

describe EmailValidator do
  subject { Validatable.new(email: email) }

  shared_examples 'has valid email' do
    it 'should be valid' do
      expect(subject).to be_valid
    end
  end

  shared_examples 'Nieprawidłowy adres email' do
    it 'should not be valid' do
      expect(subject).not_to be_valid
    end
  end

  context 'valid email adress' do
    let(:email) { 'john@example.com' }
    it_behaves_like 'has valid email'
  end

  context 'with no local-part' do
    let(:email) { '@example.com' }
    it_behaves_like 'Nieprawidłowy adres email'
  end

  context 'with no domain' do
    let(:email) { 'john@.com' }
    it_behaves_like 'Nieprawidłowy adres email'
  end

  context 'with no @' do
    let(:email) { 'john.com' }
    it_behaves_like 'Nieprawidłowy adres email'
  end

  context 'with no .' do
    let(:email) { 'john@example' }
    it_behaves_like 'Nieprawidłowy adres email'
  end

  context 'with too much @' do
    let(:email) { 'john@@example.com' }
    it_behaves_like 'Nieprawidłowy adres email'
  end
end

class Validatable
  include ActiveModel::Validations
  validates_with EmailValidator, attributes: [:email]
  attr_accessor :email

  def initialize(email:)
    @email = email
  end
end
