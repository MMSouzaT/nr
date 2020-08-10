describe "Tipos de Máquinas", :tiposmC do

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

        click_on 'Adicionar'
        click_button 'Salvar'

        erroDescr = find('#Descricao-error')
        expect(erroDescr).to have_content 'Campo de preenchimento obrigatório.'

        fill_in 'Descricao', with: '00 - Criado pelo Capybara'
        click_button 'Salvar'

        find('.btn-success', text: 'OK').click
  

    end
end