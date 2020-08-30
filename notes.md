
Notes:
- [x]  user can ADD BOOKS TO LISTS 
- [x]  nest reviews under books
- [x]  reviews new, create, edit, update, destroy (BUILD EDIT AND UPDATE)
- [x]  users new, create, edit, update
- [x]  sessions new, create, destroy
- [x]  search books from homepage or books index
- [x]  Books index, new, create, edit, update 
- [x]  lists index, new, create, edit, update 
- [x]  MAKE SURE VALIDATIONS ARE ALL THERE ON FORM ERRORS 
- [x]  user can create new lists
- [x]  user can delete a review they created
- [x]  put a books reviews on a books show page and make sure links are changed accordingly 
- [x] FIX ADD BOOK TO LIST - no repeat books 
- [x] Add conditional for ownership in view and in controller before delete and edit actions 
- [X] PREVENT A USER FROM REVIEWING A BOOK TWICE 
- [x] USER CAN DELETE A BOOK OF OF A LIST
- [x] Refactor user show page/authorization needed
- [x] REquire login before all actions besides login/signup/homepage/books 
index.  


- [ ] STYLING -see below 
- [ ] FIX IMAGES FOR USERS ? 
- [ ] GOOGLE BOOKS API 
- [ ]  use google books api for book searches, displaying images, adding books to list


STYLE: 
fix books show page 
fix lists show page  edit and delete buttons 
add dropdown for navbar 


books index 
<div class="title-container">
  <div class="search">
    <%= form_tag books_path, method: :get do %>
      <%= text_field_tag :search, params[:search], placeholder: "Enter a Title or Author"  %> 
      <%= select_tag "genre", options_from_collection_for_select(@genres, "id", "name"), include_blank:  'Select Genre' %>
      <%= submit_tag ("Search"), class: "btn btn-default" %> 
    <%end%> 
    
  </div>
  <% if admin? %>
    <div class="admin">
      <%= link_to "Add a New book", new_book_path, class: "btn btn-default" %>
      <%= link_to "Add a New genre", new_genre_path, class: "btn btn-default" %> 
    <%end%>
  </div>
</div>

</div>


  <% if @books.empty? %> 
    <div>0 Books match your search </div>
  <%else%> 
    <div class="books">  
      <% @books.each do |b| %>
        <div class="book">
          <div class="thumbnail">
            <div class="caption">
              <h3><%= link_to truncate(b.title), book_path(b) %></h3>
              <p><%= render partial: 'books', locals: {book: b} %></p>
              <p><%= link_to "See more", book_path(b), class: "btn btn-default"  %></p>
            </div>
          </div>
        </div>
      <%end%>
  <% end %> 

  _books 
  <div>
  Author: <%= book.author %><br>
  Genre:  <%= link_to book.genre.name, genre_path(book.genre) %><br>
  Synopsis: <%= truncate(book.synopsis, length: 300) %><br>
  <% if book.reviews.present? %> 
    Average Rating: <%= book.average_rating %><br>
    <%= stars(book.average_rating) %>
  <%end%> 
</div>