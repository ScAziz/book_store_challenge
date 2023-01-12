require_relative './book'

class BookRepository

    def all
        books = []
        
        sql_query = 'SELECT id, title, author_name FROM books;'
        results = DatabaseConnection.exec_params(sql_query, [])

        results.each do |record|
            single_book = Book.new

            single_book.id = record['id']
            single_book.title = record['title']
            single_book.author_name = record['author_name']
            books << single_book
        end

        return books

    end
end