# frozen_string_literal: true

require 'rails_helper'
RSpec.feature 'Creating Articles' do
  let(:user) { FactoryBot.create(:user) }
  let(:article) { FactoryBot.create(:article) }

  before(:each) do
    login_as(user)
  end

  scenario 'user creates a new article with image uploaded' do
    count = Article.all.count
    visit new_article_path

    fill_in 'article[title]', with: 'Perfect title for perfect article'
    fill_in 'article[body]', with: 'Perfect body for perfect article'
    attach_file('article[image_data][]', File.join(Rails.root, '/spec/fixtures/test_image.jpg'))
    click_button('Create Article')

    expect(page).to have_content('Perfect title for perfect article')
    expect(page).to have_content('Perfect body for perfect article')
    expect(Article.all.count).to eq(count + 1)
  end

  scenario 'user creates a new article with multiple images uploaded' do
    count = Article.all.count
    visit new_article_path

    fill_in 'article[title]', with: 'Perfect title for perfect article'
    fill_in 'article[body]', with: 'Perfect body for perfect article'
    attach_file('article[image_data][]', [File.join(Rails.root, '/spec/fixtures/test_image.jpg'),
                                          File.join(Rails.root, '/spec/fixtures/test_image2.jpg')])
    click_button('Create Article')

    expect(page).to have_content('Perfect title for perfect article')
    expect(page).to have_content('Perfect body for perfect article')
    expect(Article.all.count).to eq(count + 1)
  end

  scenario 'user edits article and uploads new file' do
    visit edit_article_path(article)

    fill_in 'article[title]', with: 'Better title for perfect article'
    fill_in 'article[body]', with: 'Better body for perfect article'
    attach_file('article[image_data][]', File.join(Rails.root, '/spec/fixtures/test_image2.jpg'))
    click_button('Update Article')

    expect(page).to have_content('Better title for perfect article')
    expect(page).to have_content('Better body for perfect article')
  end
end
