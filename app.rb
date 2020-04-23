require 'sinatra'
require 'slim'

enable :sessions

get("/") do
    slim(:index)
end

post("/logindone") do
    if params["newuser"] != nil
        session["user"] = params["newuser"]
        session["password"] = params["newpassword"]
        redirect("/")
    end
    redirect("/")
end

post("/currentuser") do
    if session["password"] != params["realpassword"]
        redirect("/error")
    end
    session.delete("user")
    session["user"] = params["newuser"]
    redirect("/")
end

get("/login") do
    slim(:login)
end

get("/error") do
    slim(:"errors/pw")
end

get('/notes') do
    slim(:"notes/show")
end

get('/notes/new') do
    slim(:"notes/new")
end

post('/notes/create') do
    if session["notes"] == nil
        session["notes"] = []
        session["notes"] << [params["rubrik"],params["ny_note"]]
    else
      session["notes"] << [params["rubrik"],params["ny_note"]]
    end
    redirect('/notes')
end

post("/notes_delete") do
    session["notes"] = []
    redirect("/notes")
end

get("/documentation") do
    slim(:documentation)
end