BASE_URL = "https://www.googleapis.com/books/v1/volumes?q="
API_PARTIAL = "&key=#{ENV['API_KEY']}"

class GoogleApi
attr_reader :results

def self.search(query)  #GoogleApi.search(search) gives me the books_array 
    results = HTTParty.get(BASE_URL + "#{query}" + "&maxResults=10" + API_PARTIAL)
    books_array = []
    results["items"].each do |item|
    book_hash = {
        :title => item["volumeInfo"]["title"],
        :author => item["volumeInfo"]["authors"].first,
        :synopsis => item["volumeInfo"]["description"], 
        :image_url => item["volumeInfo"]["imageLinks"]["thumbnail"],
        :genre => Genre.find_or_create_by(name: item["volumeInfo"]["categories"].first),
        :average_rating => item["volumeInfo"]["averageRating"]
        }
    books_array << book_hash 
    end
    books_array
end 



end
    
    
  
