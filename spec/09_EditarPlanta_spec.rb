describe "Planta", :plantaE do

    before(:each) do
        @imagem = Dir.pwd + '/spec/fixtures/imagem2.png'
    end
    it 'Editar' do
        #Bloco de Login
        visit "/Account/Login?ReturnUrl=%2F"
        
        fill_in 'UserName', with: 'marcio123'
        fill_in 'Password', with: '123456'
        click_button 'Entrar'
        select('Piatã - BA', from: 'selectUnidade') # dessa forma ele é melhor para dropdown
        # dropdownUnidade = find('.form-control')
        # dropdownUnidade.find('option', text: 'Piatã - BA').select_option
        expect(page.title).to eql "Inspeções"

        #Entrar na página Clientes
        visit "/Clientes"
        expect(page.title).to eql "Clientes"

        pegandoLinha = find('table tbody tr', text: '41.208.537/0001-29')
        pegandoLinha.find('.btn-default').click
        expect(page.title).to eql "Filiais"

        pegandoLinha = find('table tbody tr', text: '16.064.157/0001-10')
        pegandoLinha.find('.btn-default').click
        expect(page.title).to eql "Plantas"

        pegandoLinha = find('table tbody tr', text: 'Imotep')
        pegandoLinha.find('.btn-primary').click

        fill_in 'Legenda', with: ''
        click_button 'Salvar'

        erroLegenda = find('#Legenda-error')
        expect(erroLegenda).to have_content 'Campo de preenchimento obrigatório.'

        fill_in 'Legenda', with: 'Imotep'
        attach_file("ImagemUpload", @imagem, make_visible: true)
        img = find('.imgArea')
        expect(img[:src]).to include 'data:image/'

        click_button 'Salvar'
    
        selecionandoOK = find('.btn-success', text: 'OK')
        selecionandoOK.click

        expect(page.title).to eql 'Plantas'

        #excluir os itens 

        pegandoLinha = find('table tbody tr', text: 'Imotep')
        pegandoLinha.find('.btn-danger').click

        find('.btn-confirmar', text: 'Sim').click
        find('.btn-success', text: 'OK').click

        #Voltando para Filiais
        find('div li a', text: '01 - Empresa visualizada e editada pelo Capybara').click
        
        pegandoLinha = find('table tbody tr', text: '16.064.157/0001-10')
        pegandoLinha.find('.btn-danger').click
        find('.btn-confirmar', text: 'Sim').click

        visit '/Clientes'

        pegandoLinha = find('table tbody tr', text: '41.208.537/0001-29')
        pegandoLinha.find('.btn-danger').click
        find('.btn-confirmar', text: 'Sim').click

        find('.btn-success', text: 'OK').click
        
        expect(page).to_not have_content '16.064.157/0001-10'
        
    end
end