require_relative 'spec_helper'
describe Book do
  let(:book) { Book.new({ title: 'Art of war', author: 'Sun Tzu' }) }
  describe '#new' do
    it 'should return an instance of Book' do
      expect(book).to be_an_instance_of Book
      expect(book).to be_instance_of Book
      expect(book).to be_kind_of Book
    end
  end

  describe '#title' do
    it 'should return Art of war' do
      expect(book.title).to eq 'Art of war'
    end
    it 'should respond to title' do
      expect(book).to respond_to(:title)
    end
    it 'should have title attribute' do
      expect(book).to have_attributes(title: 'Art of war')
    end
  end

  describe '#author' do
    it 'should return to Sun Tzu' do
      expect(book.author).to eq 'Sun Tzu'
    end
    it 'should respond to author' do
      expect(book).to respond_to(:author)
    end
    it 'should have title attribute' do
      expect(book).to have_attributes(author: 'Sun Tzu')
    end
  end

  describe '#rentals' do
    it 'should respond to rentals' do
      expect(book).to respond_to(:rentals)
    end
    it 'should have rentals attribute' do
      expect(book).to have_attributes(rentals: [])
    end
  end
end
