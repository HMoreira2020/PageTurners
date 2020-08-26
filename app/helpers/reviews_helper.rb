module ReviewsHelper

    def stars(num)
        if num
          "⭐️" * num
        else
          "No reviews have been written."
        end
      end

      
    def review_date(datetime)
        datetime.strftime("%b %d, %Y") 
    end 

end
