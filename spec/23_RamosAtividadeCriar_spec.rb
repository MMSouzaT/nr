describe "Ramos de Atividade", :ramoC do

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

        #Indo para Sistemas 
        visit '/RamosAtividade'
        expect(page.title).to eql 'Ramo de Atividades'

        click_on 'Adicionar'
        click_button 'Salvar'

        #Capturando erros
        erroCNAE = find('#CNAE-error')
        erroRamo = find('#Nome-error')
        erroGrau = find('#GrauRisco-error')

        expect(erroCNAE).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroRamo).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroGrau).to have_content 'Campo de preenchimento obrigatório.'
        #preenchendo campos
        fill_in 'CNAE', with: '00 Capybara'
        click_button 'Salvar'
        expect(erroRamo).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroGrau).to have_content 'Campo de preenchimento obrigatório.'

        fill_in 'Nome', with: '00 Criado pela automação de testes'
        click_button 'Salvar'
        expect(erroGrau).to have_content 'Campo de preenchimento obrigatório.'

        fill_in 'GrauRisco', with: '5'
        click_button 'Salvar'

        find('.btn-success', text: 'OK').click


    end
end