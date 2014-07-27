require 'sinatra/base'
require './lib/player'
require './lib/game'

class RockPaperScissors < Sinatra::Base

  # set :views, Proc.new { File.join(root, "..", "views") }
  # set :public_folder, Proc.new { File.join(root, "..", "public")}

  enable :sessions
  # GAME = Game.new(player1, player2)

  get '/' do
    erb :index
  end

  get '/new_player_single' do
  	erb :new_player_single
  end

  get '/new_player_multiplayer' do
    erb :new_player_multiplayer
  end


  post '/register' do 
  	@player = params[:name]
  	erb :play_computer	
  end

  post '/waiting_room' do
    session[:player] = Player.new(params[:name])
    # Game.add(session[:player])
    "Please wait for other player to connect..."
    #   if GAME.start?
    #     erb :play_multiplayer 
    #   else
    #   erb :waiting_room
    # end
  end


  post "/play_computer" do
  	player = Player.new(params[:name])
  	player.picks = params[:pick]
  	computer = generate_computer
  	@game = Game.new(player, computer)
  	erb :outcome
  end

  def generate_computer
  	choice = ["Rock","Paper","Scissors"].sample

  	comp = Player.new("computer")
  	comp.picks = choice
  	comp
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
