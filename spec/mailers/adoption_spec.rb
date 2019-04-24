# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AdoptionMailer, type: :mailer do
  describe 'contact' do
    let!(:dog_adoption) { FactoryBot.build(:dog_adoption) }
    let(:mail) { AdoptionMailer.contact(dog_adoption) }

    it 'renders the headers' do
      expect(mail.subject).to eq('Contact')
      # expect(mail.to).to eq(['to@example.org'])
      # expect(mail.from).to eq(['from@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to have_selector('table tr')
    end
  end
end
