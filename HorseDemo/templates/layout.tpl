<html>
  <header>
        <style>
            body { background: #333333 ; color: #ffffff }
            
            <% block 'style' ; end %>
        </style>
        <% block 'header' ; end %>
  </header>
  <body>
        <% block 'body' %>Default Content<% end %>
  </body>
</html>