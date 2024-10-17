<h1>Users</h1>
<% for idx in Users %>
      <tr>
         <td><% idx %></td>
         <td><% Users.name %></td>
         <td><% Users.age %></td>
         <td><% Users.weight %></td>
      </tr>
  <% onbegin %>
    <table>
      <th>
         <th>No</th>
         <th>Name</th>
         <th>Age</th>
         <th>Width</th>
      </th>
  <% onend %>
    </table>
  <% onempty %>
    <div>There are no users</div>
<% end %>
