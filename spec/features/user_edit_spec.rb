require 'rails_helper'

RSpec.describe 'User Edit Form', type: :feature do
  before(:each) do
    @user = create(:user)
    sign_in @user
  end

  it 'renders the edit form' do
    visit root_path
    find('#user-edit').click
    expect(page).to have_text('Edit User')
  end

  it 'updates the user' do
    new_email = Faker::Internet.email
    new_first_name = Faker::Name.first_name
    new_last_name = Faker::Name.last_name
    new_avatar_url = Faker::Avatar.image

    visit root_path
    find('#user-edit').click
    fill_in 'user_email', with: new_email
    fill_in 'user_first_name', with: new_first_name
    fill_in 'user_last_name', with: new_last_name
    fill_in 'user_avatar_attributes_url', with: new_avatar_url
    click_button 'Update'

    expect(page).to have_text('Successfully updated!')

    @user.reload
    expect(@user.email).to eq(new_email)
    expect(@user.first_name).to eq(new_first_name)
    expect(@user.last_name).to eq(new_last_name)
    expect(@user.avatar.url).to eq(new_avatar_url)
  end
end
