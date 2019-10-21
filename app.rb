require './environment'

module FormsLab
  class App < Sinatra::Base
      get '/' do

        erb :root
      end

      get '/new' do

        erb :'pirates/new'
      end

      # get '/pirates' do
      #   @pirates = Pirate.all

      #   erb :'pirates/index'
      # end
      
      post '/pirates' do
        @pirates = Pirate.new(params[:pirate])

        params[:pirate][:ships].each do |details|
          Ship.new(details)
        end
        @ships = Ship.all
        
        erb :'pirates/show'
      end
    # code other routes/actions here

  end
end
