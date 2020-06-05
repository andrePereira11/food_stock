require 'rails_helper'

RSpec.describe Product, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "create a valid product" do
    product_type = ProductType.create(name:'Carbohydrates', description:'The main sources of carbohydrate are: rice, bread, potatoes, pasta, cassava, cereals, etc.')
    product = Product.create(name:'Macarrão',code:'A3',quantity: 3, validate_date:DateTime.now + 40, price:17.30, weight: 300,product_type_id: product_type.id)

    expect(product).to be_valid
  end

  it 'checks if error messages appear when fields are empty' do
    product = Product.create

    expect(product).not_to be_valid
    expect(product.errors[:name]).to include 'can\'t be blank'
    expect(product.errors[:code]).to include 'can\'t be blank'
    expect(product.errors[:validate_date]).to include 'can\'t be blank'    
  end

  it 'don\'t let a code be the same as an existing one' do
    product_type = ProductType.create(name:'Carbohydrates', description:'The main sources of carbohydrate are: rice, bread, potatoes, pasta, cassava, cereals, etc.')
    product1 = Product.create(name:'Macarrão',code:'A3',quantity: 3, validate_date:DateTime.now + 40, price:17.30, weight: 300,product_type_id: product_type.id)
    product = Product.create(name:'Arroz',code:'A3',quantity: 2, validate_date:DateTime.now + 40, price:15, weight: 500,product_type_id: product_type.id)
    
    expect(product).not_to be_valid
    expect(product.errors[:code]).to include 'has already been taken'
  end

  it 'checks if date is higher than today' do
    product_type = ProductType.create(name:'Carbohydrates', description:'The main sources of carbohydrate are: rice, bread, potatoes, pasta, cassava, cereals, etc.')
    product = Product.create(name:'Macarrão',code:'A3',quantity: 3, validate_date:'2019-10-18', price:17.30, weight: 300,product_type_id: product_type.id)
    
    expect(product).not_to be_valid
    expect(product.errors[:validate_date]).to include 'can\'t be in the past'
  end

  it 'check if you have not entered text in the price, quantity and weight fields' do
    product_type = ProductType.create(name:'Carbohydrates', description:'The main sources of carbohydrate are: rice, bread, potatoes, pasta, cassava, cereals, etc.')
    product = Product.create(name:'Macarrão',code:'A3',quantity: 'tyu', validate_date:DateTime.now + 40, price:'sdf', weight: 'sdf',product_type_id: product_type.id)
    
    expect(product).not_to be_valid
    expect(product.errors[:price]).to include 'is not a number'
    expect(product.errors[:weight]).to include 'is not a number'
    expect(product.errors[:quantity]).to include 'is not a number'
  end

  it 'checks if quantity, price and weight are 0 by default when fields are blank' do
    product_type = ProductType.create(name:'Carbohydrates', description:'The main sources of carbohydrate are: rice, bread, potatoes, pasta, cassava, cereals, etc.')
    product = Product.create(name:'Macarrão',code:'A3',quantity: '', validate_date:DateTime.now + 40, price:'', weight: '',product_type_id: product_type.id)
    
    expect(product).to be_valid
    expect(product.weight).to eq(0) # esperamos que seja salvo com a quantidade correta que por default é 0
    expect(product.price).to eq(0)
    expect(product.quantity).to eq(1)
  end

  it 'checks valid status' do
    product_type = ProductType.create(name:'Carbohydrates', description:'The main sources of carbohydrate are: rice, bread, potatoes, pasta, cassava, cereals, etc.')
    product = Product.create(name:'Macarrão',code:'A3',quantity: '', validate_date:DateTime.now + 40, price:17.30, weight: 300,product_type_id: product_type.id)
    product1 = Product.create(name:'Macarrão',code:'A1',quantity: '', validate_date:DateTime.now + 4, price:'', weight: '',product_type_id: product_type.id)

    expect(product).to be_valid
    expect(product1).to be_valid
    #expect(product.status).to eq('usual')
    #expect(product1.status).to eq('expired')
  end

  it 'checks if quantity is an integer number' do
    product_type = ProductType.create(name:'Carbohydrates', description:'The main sources of carbohydrate are: rice, bread, potatoes, pasta, cassava, cereals, etc.')
    product = Product.create(name:'Macarrão',code:'A3',quantity: 3.56, validate_date:DateTime.now + 40, price:17.30, weight: 300,product_type_id: product_type.id)

    expect(product).not_to be_valid
    expect(product.errors[:quantity]).to include 'must be an integer'
  end

  it 'search' do
  end

  #Update

  #Destroy
  
end
