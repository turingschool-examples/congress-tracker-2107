require 'rails_helper'

RSpec.describe "User registration form" do
  it "creates new user" do
    visit root_path

    click_on "Register as a User"

    expect(current_path).to eq(new_users_path)

    username = "funbucket13"
    password = "test"

    fill_in :user_username, with: username
    fill_in :user_password, with: password

    click_on "Create User"

    new_user = User.last
    
    expect(page).to have_content("Welcome, #{username}!")
    expect(new_user.username).to eq(username)
    expect(new_user.password_digest).to_not eq(password)
  end
end