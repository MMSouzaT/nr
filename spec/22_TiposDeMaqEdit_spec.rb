describe "Tipos de Máquinas", :tiposmE do

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
        visit '/Tipos'
        expect(page.title).to eql 'Tipos de Máquinas'

        pegandoLinha = find('table tbody tr', text: '00 - Tipo criado pelo Capybara')
        pegandoLinha.find('.btn-primary').click
        fill_in 'Descricao', with: ''

        click_button 'Salvar'

        #erroDescr = find('')
        erroDescr = find('#Descricao-error')
        expect(erroDescr).to have_content 'Campo de preenchimento obrigatório.'

        fill_in 'Descricao', with: '00 - Tipo editado pelo Capybara'
        click_button 'Salvar'

        find('.btn-success', text: 'OK').click

        pegandoLinha = find('table tbody tr', text: '00 - Tipo editado pelo Capybara')
        pegandoLinha.find('.btn-danger').click
        find('.btn-confirmar', text: 'Sim').click
        find('.btn-success', text: 'OK').click



    end
end