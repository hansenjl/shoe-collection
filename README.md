# Tues, July 14 To Do:
- Explain why we use model validations rather than view or controller validations
- Use the [Active Record Validations Guide](https://guides.rubyonrails.org/active_record_validations.html#common-validation-options) to add standard validations to our data
- Display error messages using `.errors`
- Create custom validations





# Thurs, July 9 To Do:
- Create a form for making new shoes and the corresponding new/create actions
- Demonstrate creating the same form with form_tag, form_for, and form_with
- Create the edit/update actions for editing a shoe
- Add a button to delete a shoe


```
<form action="/shoes"  method="post">
    <input type="hidden" name="authenticity_token" value="<%= form_authenticity_token %>">
    <label>Brand:</label>
    <input type="text" name="shoes[brand]" id="shoes_brand">
    <input type="submit" value="Create Shoe">
</form>

<hr>

<%= form_tag(shoes_path) do  %>
    <%= label_tag(:brand)  %>
    <%= text_field_tag(:'shoes[brand]') %>
    <%= submit_tag("Create Shoe") %>
<% end %>

<hr>

<%= form_for(@shoe) do |f|%>
    <%= f.label :brand %>
    <%= f.text_field :brand %>
    <%= f.submit %>
<% end %>

<hr>

<%= form_with(model: @shoe, class: 'new_shoe') do |f|%>
    <%= f.label :brand %>
    <%= f.text_field :brand %>
    <%= f.submit %>
<% end %>
```


# Wed, July 8 To Do:

- Make a Migration for a Shoe model
    - attributes: brand, color, price, condition
- Make a model file
- Add a few model methods:
    - #name_and_color
    - #display_price
    - .most_expensive_shoe
- Make and Index Route
   - add seed data
- Make a Show Route
- Add links to go from the index to the show route
- Add links to a layout page
- Add a custom route that shows the most expensive shoe
