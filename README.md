# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example. The landing page shows the store's inventory of products, whereby users can click to see a product's details or add a product to their cart. Products may also be viewed by their specific category. Following addition to their cart, users can then "pay" for their order using the implemented Stripe testing.

## Additional Features
* User registration and login
* Admin access to add/delete products and categories

## Final Product

| !["The landing page for the app"](https://github.com/justinkwanchan/jungle-rails/blob/master/public/images/Main.png?raw=true) | !["The product detail page"](https://github.com/justinkwanchan/jungle-rails/blob/master/public/images/Product.png?raw=true) |
| ------------- |:-------------:|
| !["The user's shopping cart"](https://github.com/justinkwanchan/jungle-rails/blob/master/public/images/Cart.png?raw=true) | !["Adding a new product as admin"](https://github.com/justinkwanchan/jungle-rails/blob/master/public/images/Admin.png?raw=true) |

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
