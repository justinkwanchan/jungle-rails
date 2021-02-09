# Things to do
* Must fix bug where registering and email already exists
* Must fix bug where registering with too short password (these two cases should show error messages)

### Removed:
* scope :ci_find, lambda { |attribute, value| where("lower(#{attribute}) = ?", value.downcase).first }
    user = User.ci_find('email', email.strip)

The rake db:setup command, which in turn calls the rake db:schema:load command, uses this schema file to create the structure of our database from scratch. This is more efficient and reliable than running all the migrations from start to finish. However, database migrations are still needed for future changes to the database schema.

bin/rake routes

The keyword 'raise' allows you to throw an error anywhere (good for debugging)

bin/rails g migration add_dicount_cents_to_products

bin/rake db:migrate
bin/rake db:rollback

rails destroy controller name

* Add this to top of any controller that should be secured
before_filter :authorize

<% if current_user %>
  Signed in as <%= current_user.name %> | <%= link_to "Logout", '/logout' %>
<% else %>
  <%= link_to 'Login', '/login' %> | <%= link_to 'Signup', '/signup' %>
<% end %>