require 'rails_helper'

RSpec.describe "Logging In" do
  it "can log in with valid credentials" do
    user = User.create(username: "funbucket13", password: "test")

    visit root_path

    click_on "I already have an account"

    expect(current_path).to eq(login_path)

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    click_on "Log In"

    expect(current_path).to eq(root_path)

    expect(page).to have_content("Welcome, #{user.username}")
    expect(page).to_not have_link("Register as a User")
    expect(page).to_not have_link("I already have an account")
    expect(page).to have_link("Log out")
  end

  it "cannot log in with bad credentials" do
    user = User.create(username: "funbucket13", password: "test")
  
    # we don't have to go through root_path and click the "I have an account" link any more
    visit login_path
  
    fill_in :username, with: user.username
    fill_in :password, with: "incorrect password"
  
    click_on "Log In"
  
    expect(current_path).to eq(login_path)
  
    expect(page).to have_content("Sorry, your credentials are bad.")
  end

  it 'can log out a logged in user' do 
    user = User.create(username: "funbucket13", password: "test")

    visit login_path
  
    fill_in :username, with: user.username
    fill_in :password, with: user.password
  
    click_on "Log In"

    click_on "Log out"

    expect(current_path).to eq(root_path)
    expect(page).to have_link("Register as a User")
    expect(page).to have_link("I already have an account")
    expect(page).to_not have_link("Log out")
    # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user.id)
  end 
end