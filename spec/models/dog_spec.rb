require 'rails_helper'

RSpec.describe Dog, type: :model do
  it 'should be invalid without a name' do
    dog = Dog.create(
      age: 2, 
      enjoys: 'Being big and red', 
      image: 'https://pyxis.nymag.com/v1/imgs/6a9/2a3/6c37ee37a2473f12b6dc4a703a50381993-09-clifford.jpg'
    )
    expect(dog.errors[:name]).to_not be_empty
  end
  it 'should be invalid without an age' do
    dog = Dog.create(
      name: 'Clifford', 
      enjoys: 'Being big and red', 
      image: 'https://pyxis.nymag.com/v1/imgs/6a9/2a3/6c37ee37a2473f12b6dc4a703a50381993-09-clifford.jpg'
    )
    expect(dog.errors[:age]).to_not be_empty
  end
  it 'should be invalid without enjoys' do
    dog = Dog.create(
      name: 'Clifford', 
      age: 2, 
      image: 'https://pyxis.nymag.com/v1/imgs/6a9/2a3/6c37ee37a2473f12b6dc4a703a50381993-09-clifford.jpg'
    )
    expect(dog.errors[:enjoys]).to_not be_empty
  end
  it 'should be invalid without an image' do
    dog = Dog.create(
      name: 'Clifford', 
      age: 2, 
      enjoys: 'Being big and red'
    )
    expect(dog.errors[:image]).to_not be_empty
  end
  it 'should be invalid if enjoys is less than 10 characters long' do
    dog = Dog.create(
      name: 'Clifford', 
      age: 2, 
      enjoys: 'pooping', 
      image: 'https://pyxis.nymag.com/v1/imgs/6a9/2a3/6c37ee37a2473f12b6dc4a703a50381993-09-clifford.jpg'
    )
    expect(dog.errors[:enjoys]).to_not be_empty
  end
end
