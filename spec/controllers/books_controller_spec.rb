require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

describe BooksController, type: 'controller' do
  let(:valid_session) { {} }
    
    
  describe 'list all books by genre' do
      it 'sort books by genre - testing controller' do
      get :index, {:sort => 'title', :genres => 'Fiction'}
      response.should redirect_to(:sort => 'title', :genres => 'Fiction')
      end
  end
    
  describe 'list all books by release date' do
      it 'sort by release date - testing controller' do
      get :index, {:sort => 'release_date', :genres => 'Fiction'}
      response.should redirect_to(:sort => 'release_date', :genres => 'Fiction')
      end
  end
  
    
  describe "GET #index" do
    it "returns a success response - testing CRUD in controller" do
      #book = Book.create!
      get :index, {}, valid_session
      expect(response).to be_success
    end
   end
  
  describe "GET #show" do
    it "returns a success response - testing CRUD in controller" do
      book = Book.create!
      get :show, {:id => book.to_param}, valid_session
      expect(response).to be_success
    end
  end
    
  describe "GET #new" do
    it "returns a success response - testing CRUD in controller" do
      get :new, {}, valid_session
      expect(response).to be_success
    end
  end
    
  describe "GET #edit" do
    it "returns a success response - testing CRUD in controller" do
      book = Book.create!
      get :edit, {:id => book.to_param}, valid_session
      expect(response).to be_success
    end
  end

  describe "DELETE #destroy - testing CRUD in controller" do
    it "destroys the requested book" do
      book = Book.create! 
      expect {
        delete :destroy, {:id => book.to_param}, valid_session
      }.to change(Book, :count).by(-1)
    end

    it "redirects to the books list - testing CRUD in controller" do
      book = Book.create! 
      delete :destroy, {:id => book.to_param}, valid_session
      expect(response).to redirect_to(books_url)
    end
  end

  describe "#author" do
    context "When specified book has a author  - testing new author feature in controller" do
      it "should find books with the same suthor" do        
        # Movie name from the actual 0.0.0.0
        expect(Book).to receive(:similar_books).with('Austerlitz')
        get :search, {title: 'Austerlitz'}
      end
    end

    context "When specified movie has no author" do
      it "should redirect to the books page if no author  - testing new author feature in controller" do
        Book.stub(:similar_books).with('No name').and_return(nil)
        get :search, {title: 'No name'}
        expect(response).to redirect_to(root_url) 
      end
    end
  end
end
      