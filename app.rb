require 'sinatra'
require 'slim'
require 'BCrypt'
require 'SQLite3'

enable :sessions

get('/') do
    slim(:index)
end

get('/outlet') do
    slim(:outlet)
end

post('/add_to_cart') do
    db = SQLite3::Database.new("db/webshop.db")
    db.results_as_hash = true
    add = db.execute("SELECT Varor.id FROM ")
end