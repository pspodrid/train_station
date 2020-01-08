require 'spec_helper'
require 'train'
require 'city'

describe '#Train' do

  describe('#save') do
    it('saves a train') do
      train = Train.new(:name => "Red", :id => nil)
      train.save
      train2 =Train.new(:name => "Blue", :id => nil)
      train2.save
      expect(Train.all).to(eq([train, train2]))
    end
  end

  describe('.all') do
    it('is empty') do
      expect(Train.all()).to(eq([]))
    end
  end

  describe('#update_name') do
    it("updates a train's name") do
      train = Train.new(:name => "Red", :id => nil)
      train.save
      train.update_name("Blue")
      expect(train.name).to(eq("Blue"))
    end
  end

  describe('#delete') do
    it('deletes a train') do
      train = Train.new(:name => "Red", :id => nil)
      train.save
      train2 = Train.new(:name => "Blue", :id => nil)
      train2.save
      train.delete
      expect(Train.all).to(eq([train2]))
    end
  end

  describe('#==') do
    it("is the same train if it has the same attributes as another train") do
      train = Train.new(:name => "Red", :id => nil)
      train.save
      train2 = Train.new(:name => "Red", :id => nil)
      train2.save
      expect(train).to(eq(train2))
    end
  end

  describe('.find_by_id') do
    it("finds a train by id") do
      train = Train.new(:name => "Red", :id => nil)
      train.save
      train2 = Train.new(:name => "Blue", :id => nil)
      train2.save
      expect(Train.find_by_id(train.id)).to(eq(train))
    end
  end
end
