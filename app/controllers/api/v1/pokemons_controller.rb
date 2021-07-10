class Api::V1::PokemonsController < ActionController::API
  before_action :set_pokemon, only: [ :show ]

  def index
    @pokemons = Pokemon.all
  end

  def show
    return render plain: 'Pokemon Not Found, Please try a different one', status: 404 unless (@pokemon = set_pokemon)
  end





  private

  def set_pokemon
    @pokemon = Pokemon.find_by(id: params[:id])
  end
end
