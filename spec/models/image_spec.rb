# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Image, type: :model do
  include CarrierWave::Test::Matchers

  before do
    ImageUploader.enable_processing = true
  end

  describe 'image versions' do
    before do
      @article = FactoryBot.create(:article)
      @article.images.create!(image: File.open('spec/fixtures/test_image.jpg'))
    end

    # describe '.small' do
    #   it "scales down an image to be exactly 100 by 100 pixels" do
    #     expect(@article.images.last.image_url).to have_dimensions(100, 100)
    #   end
    # end
    #
    # describe '.large' do
    #   it "scales down a landscape image to be no larger than 400 by 400 pixels" do
    #     expect(@article.images.last.image_url(:large)).to be_no_larger_than(400, 400)
    #   end
    # end

    after do
      ImageUploader.enable_processing = false
    end
  end
end
