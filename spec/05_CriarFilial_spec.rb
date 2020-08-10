describe "Filial", :filialC do

    it 'Adicionar' do

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

        click_on 'Adicionar'
        click_button 'Salvar'

        #campos obrigatórios
        erroRazaoSocial = find('#RazaoSocial-error')
        erroNomeFantasia = find('#Nome-error')
        erroCNPJ = find('#CNPJ-error')
        erroEndereco = find('#Endereco-error')
        erroRamoAtividade = find('#RamoAtividadeId-error')

        #erros esperados sem nenhum campo preenchido
        expect(erroRazaoSocial).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroNomeFantasia).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroCNPJ).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroEndereco).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroRamoAtividade).to have_content 'Campo de preenchimento obrigatório.'

        
        fill_in 'RazaoSocial', with: '01 - Filial criada pelo Capybara'
        click_button 'Salvar'
        #erros esperados apenas com a razão social preenchida

        expect(erroNomeFantasia).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroCNPJ).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroEndereco).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroRamoAtividade).to have_content 'Campo de preenchimento obrigatório.'
        
        fill_in 'Nome', with: '01 - Filial empresa criada pelo Capybara'
        click_button 'Salvar'
        expect(erroCNPJ).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroEndereco).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroRamoAtividade).to have_content 'Campo de preenchimento obrigatório.'
       
        fill_in 'CNPJ', with: '16.064.157/0001-10'
        click_button 'Salvar'
        expect(erroEndereco).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroRamoAtividade).to have_content 'Campo de preenchimento obrigatório.'

        fill_in 'Endereco', with: 'Rua do Ruby - Bairro do Capybara'
        click_button 'Salvar'
        expect(erroRamoAtividade).to have_content 'Campo de preenchimento obrigatório.'

        select('erroCNAE', from: 'RamoAtividadeId')

        # dropdownRamoAtvd = find('#RamoAtividadeId')
        # dropdownRamoAtvd.all('option', text: '111111.1').select_option
        click_button 'Salvar'

        selecionandoOK = find('.btn-success', text: 'OK')
        selecionandoOK.click

        expect(page.title).to eql 'Filiais'

    end

end