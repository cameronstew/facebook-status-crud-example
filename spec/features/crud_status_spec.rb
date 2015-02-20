require 'rails_helper'

describe 'User can CRUD status' do

  before :each do
    visit root_path
  end

  it 'User can see home page' do
    expect(page).to have_content 'Check out what all your friends have been up to!'
  end

  it 'User can create status' do
      click_link "New Status!"
      expect(page).to have_content 'New status Username Status'
      fill_in 'status_user_name', with: "Cameron"
      fill_in 'status_description', with: "Testing"
      click_button 'Update Status'
      expect(page).to have_content 'Status was successfully created!'
  end

  it 'User can like status' do
    click_link "New Status!"
    expect(page).to have_content 'New status Username Status'
    fill_in 'status_user_name', with: "Cameron"
    fill_in 'status_description', with: "Testing"
    click_button 'Update Status'
    expect(page).to have_content 'Status was successfully created!'

    click_button "Like"
    expect(page).to have_content 'Check out what all your friends have been up to!'
  end

  it 'User can see status show page' do
    @status = Status.create(user_name: "cws322", description: "testing")
    visit "/statuses/#{@status.id}"
    expect(page).to have_content 'Home'
  end

  it 'User can edit status' do
    @status = Status.create(user_name: "cws322", description: "testing")
    visit "/statuses/#{@status.id}/edit"
    expect(page).to have_content 'Edit status'
    fill_in 'status_user_name', with: "Cameron!"
    fill_in 'status_description', with: "Testing!!!!!"
    click_button 'Update Status'
    expect(page).to have_content 'Status was successfully updated!'
  end

  it 'User can delete status' do
    @status = Status.create(user_name: "cws322", description: "testing")
    visit "/statuses/#{@status.id}"
    expect(page).to have_content 'Home'
    click_link 'Delete'
    expect(page).to have_content 'Check out what all your friends have been up to!'
  end
end
