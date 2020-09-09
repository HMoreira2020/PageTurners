<h1>Table of Contents</h1>
About the Project
Built With
Getting Started
Installation
Contributing
License
Contact
Acknowledgements


<h2>About the Project</h2> 
A complete Ruby on Rails Content Management System that allows users who love to read to create lists, add books to their lists, 
manage lists, write book reviews and search books. The user has the option of first searching the PageTurners database for books or filtering 
by genre.  They can also search books using the Google Books API.  Incorporation of Google Books API allows a search through Google books database and creation of books that do not already exist in the PageTurners database.  Users can also upload a profile image or update the profile image. 

Authorization is run using the Pundit gem so users cannot edit or delete lists or reviews they do not own.  
Pagy gem is used to paginate the books index with 10 books maximum per page. 
Bootstrap was used for styling. 
User Authentication is done through the bcrypt gem and has_secure_password. 
Class level Scope methods are used to sort books and genres in alphabetical order. 
Third Party Authenticate is performed using facebook and google omniauth. 
User Profile picture is incorporated using Active Storage and ImageMagick. 


<h2>Built With</h2>
Ruby 
Rails 
Bootstrap


<h2>Getting Started</h2>
Run 'rails s' in your terminal and in your browser go to 'http://localhost:3000'. 


<h2>Installation</h2>
Go to https://github.com/HMoreira2020/PageTurners
Click Clone or Download
Click the clipboard icon next to the link to copy
Go to Goole Developer Console and follow the steps to create an API key. 
In your Command Line or Terminal, type 'git clone' and paste the URL and then hit enter
CD into the PageTurners directory 
Create a .env folder in your main directory and add API_KEY='YOUR API KEY' 
Run 'bundle install'
Run 'rake db:migrate'
Run 'rails s'
Go to "http://localhost:3000" 

<h2>Contributing</h2>
Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are greatly appreciated.

Fork the Project
Create your Feature Branch (git checkout -b feature/AmazingFeature)
Commit your Changes (git commit -m 'Add some AmazingFeature')
Push to the Branch (git push origin feature/AmazingFeature)
Open a Pull Request

<h2>License</h2>


<h2>Contact</h2>
Heather Moreira - moreiraheather@gmail.com

Project Link: https://github.com/HMoreira2020/PageTurners

<h2>Acknowledgements</h2>
Pagy
ImageMagick
Pundit
Omniauth 
HTTParty 
ActiveStorage

<h2>Ruby version</h2>
ruby '2.6.1'




