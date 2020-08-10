describe "Planta", :plantaC do


    before(:each) do

        @imagem = Dir.pwd + '/spec/fixtures/imagem.png'
    end
    it 'Criar' do

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

        click_on 'Adicionar'
        click_button 'Salvar'

        erroLegenda = find('#Legenda-error')
        erroImagem = find('#ImagemUpload-error')

        expect(erroLegenda).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroImagem).to have_content 'Campo de preenchimento obrigatório.'

        fill_in 'Legenda', with: 'Imotep'
        click_button 'Salvar'
        expect(erroImagem).to have_content 'Campo de preenchimento obrigatório.'


        # page.attach_file(@imagem) do
        #     page.find('.btn-success', text: 'Selecione um arquivo')
        #   end
        attach_file("ImagemUpload", @imagem, make_visible: true)

        img = find('.imgArea')
        expect(img[:src]).to include 'data:image/'

        click_button 'Salvar'
        selecionandoOK = find('.btn-success', text: 'OK')
        selecionandoOK.click

        expect(page.title).to eql 'Plantas'


    end
end