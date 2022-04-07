require 'rails_helper'

RSpec.describe "Dogs", type: :request do
  describe "GET /index" do
    it 'gets a list of dogs' do
      Dog.create(
        name: 'Kai',
        age: 2,
        enjoys: 'Eating anything on the ground (mostly sticks)',
        image: 'https://github.com/Rethora/dogpics/blob/main/kai.jpg?raw=true'
      )
      get '/dogs'
      dog = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(dog.length).to eq 1
    end
  end
  describe 'POST /create' do
    it 'creates a new dog' do
      dog_params = {
        dog: {
          name: 'Kai',
          age: 2,
          enjoys: 'Eating anything on the ground (mostly sticks)',
          image: 'https://github.com/Rethora/dogpics/blob/main/kai.jpg?raw=true'
        }
      }

      post '/dogs', params: dog_params
      expect(response).to have_http_status(200)
      dog = Dog.first
      expect(dog.name).to eq 'Kai'
      expect(dog.age).to eq 2
      expect(dog.enjoys).to eq 'Eating anything on the ground (mostly sticks)'
      expect(dog.image).to eq 'https://github.com/Rethora/dogpics/blob/main/kai.jpg?raw=true'
    end
  end
  describe 'PATCH /update' do
    it 'updates a dog' do
      old_dog = Dog.create(
        name: 'Kai',
        age: 2,
        enjoys: 'Eating anything on the ground (mostly sticks)',
        image: 'https://github.com/Rethora/dogpics/blob/main/kai.jpg?raw=true'
      )
      dog_params = {
        dog: {
          name: 'Kai',
          age: 2,
          enjoys: 'Sleeping in front of the door',
          image: 'https://github.com/Rethora/dogpics/blob/main/kai.jpg?raw=true'
        }
      }
      patch "/dogs/#{old_dog.id}", params: dog_params
      dog = Dog.find(old_dog.id)
      expect(response).to have_http_status(200)
      expect(dog.enjoys).to eq 'Sleeping in front of the door'
    end
  end
  describe 'DELETE /destroy' do
    it 'deletes a dog from the DB' do
      old_dog = Dog.create(
        name: 'Kai',
        age: 2,
        enjoys: 'Eating anything on the ground (mostly sticks)',
        image: 'https://github.com/Rethora/dogpics/blob/main/kai.jpg?raw=true'
      )
      delete "/dogs/#{old_dog.id}"
      expect(response).to have_http_status(200)
      dogs = Dog.all
      expect(dogs).to be_empty
    end
  end
end
