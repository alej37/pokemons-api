require 'rails_helper'

RSpec.describe Api::V1::PokemonsController, type: :controller do
  describe '.show' do
    subject { get :show, params: params }

    context 'given an invalid id' do
      let(:params) do
        { id: 802 }
      end

      it 'should return a non found error' do
        expect(subject.status).to eq(404)
      end
    end
  end
end

