module ReviewsHelper

    def review_date(datetime)
        datetime.strftime("%b %d, %Y") 
    end 
end
