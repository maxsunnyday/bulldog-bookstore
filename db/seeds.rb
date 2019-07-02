# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Listing.destroy_all
Book.destroy_all
Order.destroy_all
User.destroy_all

gatsby = Book.create(title: "The Great Gatsby", author: "F. Scott Fitzgerald", isbn_number: 9129402814)
into_thin_air = Book.create(title: "Into Thin Air", author: "Jon Krakauer", isbn_number: 4129421414)
forever_war = Book.create(title: "The Forever War", author: "John Haldeman", isbn_number: 2110001212)
i_robot = Book.create(title: "I, Robot", author: "Isaac Asimov", isbn_number: 4112140000)
great_expectations = Book.create(title: "Great Expectations", author: "Mark Twain", isbn_number: 6469219999)
bad_blood = Book.create(title: "Bad Blood", author: "John Carreyrou", isbn_number: 3139402312)
tinker_tailor = Book.create(title: "Tinker, Tailor, Soldier, Spy", author: "John Le Carre", isbn_number: 9129402814)
poodr = Book.create(title: "Practical Object-Oriented Design in Ruby", author: "Sandi Metz", isbn_number: 9125302414)
bovary = Book.create(title: "Madame Bovary", author: "Gustave Flaubert", isbn_number: 9129402814)

ganesh = User.create(first_name: "Ganesh", last_name: "Raj", username: "graj", email: "graj08@gmail.com", password: "graj")
max = User.create(first_name: "Max", last_name: "Sun", username: "maxsunnyday", email: "max.sun@yale.edu", password: "maxsunnyday")
prince = User.create(first_name: "Prince", last_name: "Wilson", username: "maxcell", email: "prince@flatironschool.com", password: "maxcell")
gigi = User.create(first_name: "Gigi", last_name: "Hoagland", username: "gigi", email: "gigi@flatironschool.com", password: "gigi")
rina = User.create(first_name: "Rina", last_name: "Kawamura", username: "rkawamura", email: "rina.kawamura@yale.edu", password: "rinakawamura")
ekow = User.create(first_name: "Ekow", last_name: "Buadu", username: "ebuadu", email: "ekow.buadu@yale.edu", password: "ebuadu")

listing_1 = Listing.create(user: gigi, book: gatsby, price: 10.99)
listing_2 = Listing.create(user: max, book: i_robot, price: 15.99)
listing_3 = Listing.create(user: ganesh, book: bad_blood, price: 20.99)
listing_4 = Listing.create(user: gigi, book: bovary, price: 9.99)
listing_5 = Listing.create(user: ganesh, book: gatsby, price: 9.99)
listing_6 = Listing.create(user: rina, book: tinker_tailor, price: 7.99)
listing_7 = Listing.create(user: ekow, book: poodr, price: 8.99)
listing_8 = Listing.create(user: prince, book: poodr, price: 8.99)
listing_9 = Listing.create(user: max, book: poodr, price: 9.99)
listing_10 = Listing.create(user: prince, book: great_expectations, price: 8.99)


