# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Cancha, type: :request do
  before(:all) do
    @cancha = create(:cancha)
    @cancha.save
  end

  describe 'crear cancha' do
    it 'si tiene atributos validos' do
      expect do
        post canchas_path, params: {
          cancha: {
            nombre: @cancha.nombre,
            deporte: @cancha.deporte,
            estado: @cancha.estado
          }
        }
      end.to change(Cancha, :count).by(1)
    end

    it 'si tiene atributos invalidos#1' do
      expect do
        post canchas_path, params: {
          cancha: {
            nombre: nil,
            deporte: @cancha.deporte,
            estado: @cancha.estado
          }
        }
      end.to change(Cancha, :count).by(0)
    end

    it 'si tiene atributos invalidos#2' do
      expect do
        post canchas_path, params: {
          cancha: {
            nombre: @cancha.nombre,
            deporte: nil,
            estado: @cancha.estado
          }
        }
      end.to change(Cancha, :count).by(0)
    end

    it 'si tiene atributos invalidos#3' do
      expect do
        post canchas_path, params: {
          cancha: {
            nombre: @cancha.nombre,
            deporte: @cancha.deporte,
            estado: nil
          }
        }
      end.to change(Cancha, :count).by(0)
    end

    it 'si tiene atributos invalidos#4' do
      expect do
        post canchas_path, params: {
          cancha: {
            nombre: @cancha.nombre,
            deporte: nil,
            estado: nil,
            id_arrendatario: 'Juan'
          }
        }
      end.to change(Cancha, :count).by(0)
    end
  end

  describe 'actualizar cancha' do
    it 'si tiene atributos validos#1' do
      patch cancha_path(@cancha), params: {
        cancha: {
          nombre: @cancha.nombre,
          deporte: 'Piscina',
          estado: @cancha.estado
        }
      }
      expect(Cancha.find(@cancha.id).deporte).to eq('Piscina')
    end

    it 'si tiene atributos validos#2' do
      patch cancha_path(@cancha), params: {
        cancha: {
          nombre: 'Volei Playa',
          deporte: @cancha.deporte,
          estado: @cancha.estado
        }
      }
      expect(Cancha.find(@cancha.id).nombre).to eq('Volei Playa')
    end

    it 'si tiene atributos validos#3' do
      patch cancha_path(@cancha), params: {
        cancha: {
          nombre: @cancha.nombre,
          deporte: @cancha.deporte,
          estado: 'Ocupada'
        }
      }
      expect(Cancha.find(@cancha.id).estado).to eq('Ocupada')
    end

    it 'si tiene atributos invalidos#1' do
      patch cancha_path(@cancha), params: {
        cancha: {
          nombre: @cancha.nombre,
          deporte: @cancha.deporte,
          estado: ''
        }
      }
      expect(Cancha.find(@cancha.id).estado).to eq(@cancha.estado)
    end

    it 'si tiene atributos invalidos#2' do
      patch cancha_path(@cancha), params: {
        cancha: {
          nombre: @cancha.nombre,
          deporte: '',
          estado: @cancha.estado
        }
      }
      expect(Cancha.find(@cancha.id).deporte).to eq(@cancha.deporte)
    end

    it 'si tiene atributos invalidos#3' do
      patch cancha_path(@cancha), params: {
        cancha: {
          nombre: '',
          deporte: @cancha.deporte,
          estado: @cancha.estado
        }
      }
      expect(Cancha.find(@cancha.id).nombre).to eq(@cancha.nombre)
    end

    it 'si tiene atributos invalidos#4' do
      patch cancha_path(@cancha), params: {
        cancha: {
          nombre: '',
          deporte: '',
          estado: @cancha.estado
        }
      }
      expect(Cancha.find(@cancha.id).nombre).to eq(@cancha.nombre)
      expect(Cancha.find(@cancha.id).deporte).to eq(@cancha.deporte)
    end
  end

  describe 'eliminar cancha' do
    it 'si tiene atributos validos' do
      expect do
        delete cancha_path(@cancha)
      end.to change(Cancha, :count).by(-1)
    end
  end
end
