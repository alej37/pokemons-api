require 'rails_helper'

RSpec.describe Api::V1::PokemonsController, type: :controller do
   describe '.show' do
    subject { get :show, params: params }

    context 'with an non existing id' do
      let(:params) do
        { id: 805 }
      end

      it 'should returns an not found error with a non existing id' do
        expect(subject.status).to eq(404)
      end
    end
  end

  describe '.destroy' do
    context 'test destroy routing' do
      let!(:pokemon) { Pokemon.create(name: 'pikachu') }

      it 'should delete a created pokemon' do
        expect(Pokemon.find_by(name: 'pikachu')).to_not be_nil
        post :destroy, params: { id: pokemon.id }
        expect(Pokemon.find_by(name: 'pikachu')).to be_nil
      end
    end
  end
end

