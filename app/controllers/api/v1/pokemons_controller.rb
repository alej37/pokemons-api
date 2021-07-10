class Api::V1::PokemonsController < ActionController::API
  before_action :set_pokemon, only: [ :show, :update, :destroy ]

  def index
    @pokemons = Pokemon.all
  end

  def show
    return render plain: 'Pokemon Not Found, Please try a different one', status: 404 unless (@pokemon = set_pokemon)
  end

  def create
    new_pokemon = Pokemon.new(pokemon_params)

    if new_pokemon.save
      status = "Pokemon #{new_pokemon.name} has been created"
    else
      render_error
    end

    render plain: status

  end

  def update
    return render plain: 'Pokemon Not Found, Please try a different one', status: 404 unless (@pokemon = set_pokemon)

    if pokemon.update(pokemon_params)
      status = "Your Pokemon has been updated!"
    else 
      render_error
    end

    render plain: status
  end

  def destroy
    return render plain: 'Pokemon Not Found, Please try a different one', status: 404 unless (@pokemon = set_pokemon)

    if pokemon.delete
      status = "Pokemon: #{pokemon.name} is no longer in existance"
    else
      status = "Sorry, this pokemon cannot be destroyed"
    end

    render plain: status

  end


  private

  def set_pokemon
    @pokemon = Pokemon.find_by(id: params[:id])
  end

  def render_error
    render json: { errors: @pokemon.errors.full_messages },
    status: :unprocessable_entity
  end

  def pokemon_params
    params.permit([
      :name,
      :type_one,
      :type_two,
      :total, 
      :hp, 
      :attack,
      :defense,
      :sp_attack,
      :sp_defense,
      :speed,
      :genereation,
      :legendary  
      ])
  end
end
