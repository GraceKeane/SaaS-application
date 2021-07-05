module BooksHelper
    ###
    def selectedgenre?(genre)
        selectedgenre = session[:genres]
        return true if selectedgenre.nil?
        selectedgenre.include? genre
    end
    
    def hilite(form_column)
        if (session[:sort].to_s == form_column)
            return 'hilite'
        else
            return nil
        end
    end
end
