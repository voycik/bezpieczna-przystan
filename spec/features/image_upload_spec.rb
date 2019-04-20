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

    fill_in 'article[title]', with: "Perfect title for perfect article"
    fill_in 'article[body]', with: "Perfect body for perfect article"
    attach_file('article[image_data][]', File.join(Rails.root, '/spec/fixtures/test_image.jpg'))
    click_button('Create Article')

    expect(page).to have_content('Perfect title for perfect article')
    expect(page).to have_content('Perfect body for perfect article')
    expect(Article.all.count).to eq(count + 1)
    expect(Article.last.images.size).to eq(1)

    visit article_path(Article.last)
    image = Article.last.images.last
    expect(page.find("#article_image_#{image.id}")['src']).to have_content image.image_url
  end

  scenario 'user creates a new article with multiple images uploaded' do
    count = Article.all.count
    visit new_article_path

    fill_in 'article[title]', with: "Perfect title for perfect article"
    fill_in 'article[body]', with: "Perfect body for perfect article"
    attach_file('article[image_data][]', [File.join(Rails.root, '/spec/fixtures/test_image.jpg'),
                          File.join(Rails.root, '/spec/fixtures/test_image2.jpg')])
    click_button('Create Article')

    expect(page).to have_content('Perfect title for perfect article')
    expect(page).to have_content('Perfect body for perfect article')
    expect(Article.all.count).to eq(count + 1)
    expect(Article.last.images.size).to eq(2)
    first_image = Article.last.images.first
    second_image = Article.last.images.second

    visit article_path(Article.last)
    expect(page.find("#article_image_#{first_image.id}")['src']).to have_content first_image.image_url
    expect(page.find("#article_image_#{second_image.id}")['src']).to have_content second_image.image_url
  end

  scenario 'user edits article and uploads new file' do
    visit edit_article_path(article)
    article.images.create!(image: File.open("#{Rails.root}/spec/fixtures/test_image.jpg"))
    first_image_url = article.images.first.image_url

    fill_in 'article[title]', with: "Better title for perfect article"
    fill_in 'article[body]', with: "Better body for perfect article"
    attach_file('article[image_data][]', File.join(Rails.root, '/spec/fixtures/test_image2.jpg'))
    click_button('Update Article')

    expect(page).to have_content('Better title for perfect article')
    expect(page).to have_content('Better body for perfect article')
    expect(article.images.size).to eq(1)
    second_image = article.images.first
    expect(second_image.image_url).to_not eq(first_image_url)

    visit article_path(article)
    expect(page.find("#article_image_#{second_image.id}")['src']).to have_content second_image.image_url
  end
end
