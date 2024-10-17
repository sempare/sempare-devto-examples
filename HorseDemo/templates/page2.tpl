<% extends 'layout' %>
   <% block 'header' %><title>Page2</title><% end %>
   <% block 'body' %>
     <% for user of users ; user ; betweenitems %>, <% end %>
   <% end %>
<% end %>