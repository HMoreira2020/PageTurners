BASE_URL = "https://www.googleapis.com/books/v1/volumes?q="
API_PARTIAL = "&key=#{ENV['API_KEY']}"

class GoogleApi
attr_reader :results

def self.search(query)  #GoogleApi.search(search) gives me the books_array 
    results = HTTParty.get(BASE_URL + "#{query}" + "&maxResults=10" + API_PARTIAL)
    books_array = []
    results["items"].each do |item|
    # book_hash = {
    #     :title => item["volumeInfo"]["title"],
    #     :author => item["volumeInfo"]["authors"].first,
    #     :synopsis => item["volumeInfo"]["description"], 
    #     :image_url => item["volumeInfo"]["imageLinks"]["thumbnail"], #how to handle the nil values here too
    #     :genre => Genre.find_or_create_by(name: item["volumeInfo"]["categories"].first) if item["volumeInfo"]["categories"] #if item["volumeInfo"]["categories"] - won't let me do this modifier.  
    #     }
    book_hash = {}
        book_hash[:title] = item["volumeInfo"]["title"]
        book_hash[:author] = item["volumeInfo"]["authors"].first if item["volumeInfo"]["authors"]
        book_hash[:synopsis] = item["volumeInfo"]["description"]
        book_hash[:image_url] = item["volumeInfo"]["imageLinks"]["thumbnail"] if item["volumeInfo"]["imageLinks"]
        book_hash[:genre] = Genre.find_or_create_by(name: item["volumeInfo"]["categories"].first) if item["volumeInfo"]["categories"]
    books_array << book_hash 
    end
    books_array
end 



end
    


