
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
LIMIT BOOKS PER PAGE on BOOKS INDEX 
How do I fix the buttons on the users show page to be next to one another 
do I need to use more helpers? Dry up views conditionals? 
GET USER IMAGE WORKING TO DISPLAY 


future goals 

read list displays with count of books 
rank users on most books read 
rank users on most books reviewed 

 <%= form_tag list_path(@list), method: "delete" do %>
                <%= submit_tag "Delete List",  class: "btn btn-primary" %>
            <% end %>



user show page
 <div class="title-container">
<% if @user == current_user %>
    <h2>Your Lists</h2>
<% else %> 
    <h2><%= @user.username%>'s Lists</h2>
<%end%>
</div>

<% if @user.lists.empty? %> 
  <% if @user == current_user %>
    You have no lists yet. 
  <%else %>
    <%= @user.username%> has no lists yet.
  <%end%>
<%else%> 
<div class="list">  
  <% @user.lists.each do |list| %>
    <div class="list">
      <div class="thumbnail">
        <div class="caption">
          <p><%= link_to list.title, user_list_path(@user, list) %></p>
        </div>
      </div>
    </div>
  <%end%>
<%end%>

<% if @user == current_user %> 
<div class="user-actions">
    <%= link_to "Create New List", new_user_list_path(@user, @list), class: "btn btn-primary" %><br> 
    <%= link_to "Edit Profile", edit_user_path(@user), class: "btn btn-primary" %>
</div>
<%end%>
