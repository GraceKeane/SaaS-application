class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
    
    
    def index
        sort = params[:sort] || session[:sort]
        case sort
        when 'title'
          # Tested this by using desc instead of asc - Test failed as expected
          ordering,@title_header = {:title => :asc}, 'bg-warning hilite'
        when 'release_date'
          # Tested this by using desc instead of asc - Test failed as expected
          ordering,@date_header = {:release_date => :asc}, 'bg-warning hilite'
        end
        @all_genres = Book.all_genres
        @selected_genres = params[:genres] || session[:genres] || {}

        if @selected_genres == {}
          @selected_genres = Hash[@all_genres.map {|genre| [genre, genre]}]
        end

        if params[:sort] != session[:sort] or params[:genres] != session[:genres]
          session[:sort] = sort
          session[:genres] = @selected_genres
          redirect_to :sort => sort, :genres => @selected_genres and return
        end
        @books = Book.where(genre: @selected_genres.keys).order(ordering)
        # Testing
        #@movies = Movie.all
  end

  # GET /books/1
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end
    
  # Add an Author
  def search
    @similar_books = Book.similar_books(params[:title])
    if @similar_books.nil?
        redirect_to root_url, alert: flash[:notice] = "'#{params[:title]}' has no director info"
    end
      @book = Book.find_by(title: params[:title])
  end

  # DELETE /books/1
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Book '#{@book.title}' deleted."
    redirect_to books_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def book_params
      params.require(:book).permit(:title, :genre, :description, :release_date, :author)
    end
end
