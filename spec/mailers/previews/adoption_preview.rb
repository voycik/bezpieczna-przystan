# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/adoption
class AdoptionPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/adoption/contact
  def contact
    AdoptionMailer.contact
  end
end
