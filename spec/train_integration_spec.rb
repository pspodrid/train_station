require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create an train path', {:type => :feature}) do
  it('creates a train and then goes to the trains page') do
    visit('/trains')
    click_on('Add a new train')
    fill_in('train_name', :with => 'Red')
    click_on('Add')
    expect(page).to have_content('Red')
  end
end

describe('updates a train path', {:type => :feature}) do
  it('updates a train and then goes to the train page') do
    visit("/trains")
    click_on('Add a new train')
    fill_in('train_name', :with => 'Red')
    click_on('Add')
    click_on('Red')
    click_on('Update train')
    fill_in('name', :with => 'Blue')
    click_on('Update')
    expect(page).to have_content('Blue')
  end
end

describe('deletes a train path', {:type => :feature}) do
  it('deletes a train and then goes to the trains page') do
    visit("/trains")
    click_on('Add a new train')
    fill_in('train_name', :with => 'Red')
    click_on('Add')
    click_on('Add a new train')
    fill_in('train_name', :with => 'Blue')
    click_on('Add')
    click_on('Red')
    click_on('Delete')
    expect(page).to have_no_content('Red')
  end
end

describe('create a city path', {:type => :feature}) do
  it('creates a city and then goes to the cities page') do
    visit("/cities")
    click_on('Add a new city')
    fill_in('city_name', :with => 'Portland')
    click_on('Add')
    expect(page).to have_content('Portland')
  end
end

describe('updates a city path', {:type => :feature}) do
  it('updates a city and then goes to the city page') do
    visit("/cities")
    click_on('Add a new city')
    fill_in('city_name', :with => 'Portland')
    click_on('Add')
    click_on('Portland')
    click_on('Update city')
    fill_in('name', :with => 'Seattle')
    click_on('Update')
    expect(page).to have_content('Seattle')
  end
end

describe('deletes a city path', {:type => :feature}) do
  it('deletes a city and then goes to the cities page') do
    visit("/cities")
    click_on('Add a new city')
    fill_in('city_name', :with => 'Portland')
    click_on('Add')
    click_on('Add a new city')
    fill_in('city_name', :with => 'Seattle')
    click_on('Add')
    click_on('Portland')
    click_on('Delete')
    expect(page).to have_no_content('Portland')
  end
end
