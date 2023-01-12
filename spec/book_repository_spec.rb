require 'book_repository'

def reset_books_table
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
    connection.exec(seed_sql)
  end
  
  describe BookRepository do
    before(:each) do 
      reset_books_table
    end

    context 'given a table with 3 entries' do
      it 'has a length equal to 3' do 
        book_repo = BookRepository.new

        book_collection = book_repo.all
        expect(book_collection.length).to eq 3
      end
    end

    context 'given a table where the first entry is The Waves' do 
      it 'shows the first title to be The Waves' do 
        book_repo = BookRepository.new

        book_collection = book_repo.all
        expect(book_collection[0].title).to eq 'The Waves'
      end
    end
  
    
  end