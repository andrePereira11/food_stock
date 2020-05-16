require "rails_helper"

feature "create product" do
  scenario "product created with success" do
    product_type = ProductType.create(name:'Carbohydrates', description:'The main sources of carbohydrate are: rice, bread, potatoes, pasta, cassava, cereals, etc.')

    visit root_path
    #find(:xpath, ".//a[i[contains(@class, 'material-icons')]]").click        #Modo de encntrar um icone
    click_link 'link_new_product'                 #Encontrar pelo id

    fill_in 'Name', with: 'Arroz'
    fill_in 'Code', with: 'A9'
    select product_type.name, from: 'Type'
    fill_in 'Validate Date', with: '2020/10/15'
    fill_in 'Name', with: 17
    fill_in 'Weight', with: 15000
    click_on 'Add'

    #expect(page).to have_content('Item cadastrado com sucesso')
    #expect(page).to have_selector('div h4.mdl-cell mdl-cell--12-col')
    #expect(page).to have_content('Arroz')
    expect(page).to have_content('A9')
    expect(page).to have_content('2020-10-15')
    expect(page).to have_content('17')
    expect(page).to have_content('15000')
  end 

  scenario "empty fields" do
    visit root_path
    click_on '+'

    fill_in 'Name', with: ''
    click_on 'Add'

    expect(page).to have_content('Preencha os campos obrigatórios')
    expect(page).not_to have_content('Macarrão')
  end

  scenario "can\'t be duplicate code" do
  end

  scenario "system generate code" do
  end
end