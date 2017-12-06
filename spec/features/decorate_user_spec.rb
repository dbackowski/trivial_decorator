require 'spec_helper'

feature 'Decorate user model' do
  before(:each) do
    30.times do
      FactoryBot.create(:user)
    end
  end

  it 'renders decorated users collection' do
    visit '/users'

    expect(page).to have_content('John Doe')

    visit '/users?page=2'

    expect(page).to have_content('John Doe 26')
  end
end
