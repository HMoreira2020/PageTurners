# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


books = Book.create(
        [{
            title: "The New Confessions of an Economic Hit Man", 
            author: "John Perkins", 
            synopsis: "Former economic hit man John Perkins shares new details about the ways he and others cheated countries around the globe out of trillions of dollars. ",
            genre_id: 8,
            user_id: 1

    },
        {
            title: "All the Light We Cannot See", 
            author: "Anthony Doerr", 
            synopsis: "From the highly acclaimed, multiple award-winning Anthony Doerr, the stunningly beautiful instant New York Times bestseller about a blind French girl and a German boy whose paths collide in occupied France as both try to survive the devastation of World War II.",
            genre_id: 2,
            user_id: 1
        
    }, 
    {
            title: "Untamed", 
            author: "Glennon Doyle", 
            synopsis: "There is a voice of longing inside every woman. We strive so mightily to be good: good mothers, daughters, partners, employees, citizens, and friends. We believe all this striving will make us feel alive. Instead, it leaves us feeling weary, stuck, overwhelmed, and underwhelmed. We look at our lives, relationships, and world, and wonder: Wasn’t it all supposed to be more beautiful than this?",
            genre_id: 6,
            user_id: 1
    }, 
    {
            title: "Educated", 
            author: "Tara Westover", 
            synopsis: "With the acute insight that distinguishes all great writers, Westover has crafted a universal coming-of-age story that gets to the heart of what an education is and what it offers: the perspective to see one's life through new eyes and the will to change it.",
            genre_id: 6,
            user_id: 2
    },
        {
            title: "Love Warrior", 
            author: "Glennon Doyle", 
            synopsis: "The highly anticipated new memoir by bestselling author Glennon Doyle Melton tells the story of her journey of self-discovery after the implosion of her marriage.",
            genre_id: 6,
            user_id: 3
    },
        {
            title: "Unbroken: A World War II Story of Survival, Resilience and Redemption", 
            author: "Laura Hillenbrand", 
            synopsis: "The harrowing story of Louis Zamperini.",
            genre_id: 1,
            user_id: 2
    },  
    ])


genres = Genre.create(
    [
    {name: 'Biography' }, 
    {name: 'Fiction' }, 
    {name: 'Historical Fiction'}, 
    {name: 'History' }, 
    {name: 'Humor and Comedy' }, 
    {name: 'Memoir' }, 
    {name: 'Mystery' }, 
    {name: 'Nonfiction' }, 
    {name: 'Adult' }, 
    {name: 'Self Help' }, 
    {name: 'Christian' }, 
    {name: 'Cookbooks'}, 
    {name: 'Fantasy' }, 
    {name: 'Science Fiction' }, 
    {name: 'Crime' }, 
    {name: 'Classics' }
    ])

users = User.create(
    [
        {name: 'Chris Moreira', username: 'HistoryBuff', email: 'historyismyjam@gmail.com', password: 'history'}, 
        {name: 'Ron Trimarchi', username: 'BiographiesPlease', email: 'biographynerd@gmail.com', password: 'biography'}, 
        {name: 'Belinda White', username: 'ReadingMachine', email: 'readingmachine@gmail.com', password: 'reading'}
    ])

