BASE_URL = "https://www.googleapis.com/books/v1/volumes?q="
API_PARTIAL = "&key=#{ENV['API_KEY']}"

class GoogleApi
attr_reader :results

def self.search(query)  #GoogleApi.search(search) gives me the books_array 
    @results = HTTParty.get(BASE_URL + "#{query}" + "&maxResults=10" + API_PARTIAL)
    books_array = []
    @results["items"].each do |item|
    book_hash = {
        :title => item["volumeInfo"]["title"],
        :author => item["volumeInfo"]["authors"],
        :synopsis => item["volumeInfo"]["description"], 
        :image => item["volumeInfo"]["imageLinks"]["thumbnail"],
        :genre => item["volumeInfo"]["categories"]
        }
    books_array << book_hash 
    end
    books_array
end 


end
    
    
    # HTTParty.get("https://www.googleapis.com/books/v1/volumes?q=" + params[:search] + "&maxResults=10" + "&key=AIzaSyAv3lmqJ7_CRldsUOz8K2-otEw1EPj_NTg")
    # item["volumeInfo"]["averageRating"]
    # genre => item["volumeInfo"]["categories"
  
    
    # GoogleApi.search(query) #=> an array of hashes that represent books 
