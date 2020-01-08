require 'spec_helper'
require 'train'
require 'city'

describe '#City' do

  describe('#save') do
    it('saves a city') do
      city = City.new(:name => "Red", :id => nil)
      city.save
      city2 =City.new(:name => "Blue", :id => nil)
      city2.save
      expect(City.all).to(eq([city, city2]))
    end
  end

  describe('.all') do
    it('is empty') do
      expect(City.all()).to(eq([]))
    end
  end

  describe('#update_name') do
    it("updates a city's name") do
      city = City.new(:name => "Red", :id => nil)
      city.save
      city.update_name("Blue")
      expect(city.name).to(eq("Blue"))
    end
  end

  describe('#delete') do
    it('deletes a city') do
      city = City.new(:name => "Red", :id => nil)
      city.save
      city2 = City.new(:name => "Blue", :id => nil)
      city2.save
      city.delete
      expect(City.all).to(eq([city2]))
    end
  end

  describe('#==') do
    it("is the same city if it has the same attributes as another city") do
      city = City.new(:name => "Red", :id => nil)
      city.save
      city2 = City.new(:name => "Red", :id => nil)
      city2.save
      expect(city).to(eq(city2))
    end
  end

  describe('.find_by_id') do
    it("finds a city by id") do
      city = City.new(:name => "Red", :id => nil)
      city.save
      city2 = City.new(:name => "Blue", :id => nil)
      city2.save
      expect(City.find_by_id(city.id)).to(eq(city))
    end
  end
end
