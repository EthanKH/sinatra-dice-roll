require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  erb(:elephant)
end

get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/giraffe") do
  "Hopefully this shows up without having to restart the server 🤞🏾"
end

get("/dice/2/6") do
  @rolls = []
  2.times do
    die = rand(1..6)
    @rolls.push(die)
  end
=begin
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
=end
  erb(:two_six, { :layout => :wrapper})
end

get("/dice/2/10") do
  @rolls = []
  2.times do
    die = rand(1..10)
    @rolls.push(die)
  end
=begin
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die
  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
=end  
  erb(:two_ten, { :layout => :wrapper})
  
end

get("/dice/1/20") do
  @rolls = []
  1.times do
    die = rand(1..20)
    @rolls.push(die)
  end
=begin
  @die = rand(1..20)
  @outcome = "You rolled a #{@die}."

  Original one_twenty.erb code under body tag
  <% if @die == 1 %>
      <p style="color: red"><%= @outcome %></p>
    <% elsif @die == 20 %>
      <p style="color: green"><%= @outcome %></p>
    <% else %>
      <p><%= @outcome %></p>
    <% end %>
=end  
  erb(:one_twenty, { :layout => :wrapper})
end

get("/dice/5/4") do
  @rolls = []
  5.times do
    die = rand(1..4)
    @rolls.push(die)
  end
=begin
  first_die = rand(1..4)
  second_die = rand(1..4)
  third_die = rand(1..4)
  fourth_die = rand(1..4)
  sum = first_die + second_die + third_die + fourth_die
  @outcome = "You rolled a #{first_die}, #{second_die}, #{third_die}, and #{fourth_die} for a total of #{sum}."
=end
  erb(:five_four, { :layout => :wrapper})
end

get("/dice/100/6") do
  @rolls = []
  100.times do
    die = rand(1..6)
    @rolls.push(die)
  end
  erb(:one_hundred_six)
end
