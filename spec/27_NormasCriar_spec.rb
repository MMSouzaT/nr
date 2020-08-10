describe "Normas", :normasC do

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
        visit '/Grupos'
        expect(page.title).to eql 'Normas'

        click_on 'Adicionar'
        click_button 'Salvar'

        erroNome = find('#Nome-error')
        expect(erroNome).to have_content 'Campo de preenchimento obrigatório.'

        fill_in 'Nome', with: '00 - Norma criada pelo Capybara'
        click_button 'Salvar'
        find('.btn-success', text: 'OK').click
    end
end