require_relative 'lib/database_connection'
require_relative 'lib/book_repository'

DatabaseConnection.connect('book_store')

book_repo = BookRepository.new

book_repo.all.each do |book| 

  pretty_string = "#{book.id} - #{book.title} - #{book.author_name}\n"
  print pretty_string
end








