
describe 'Login', :login do

    it 'login' do 
        

        #Entrar na página
        visit "/Account/Login?ReturnUrl=%2F"
        expect(page.title).to eql "Autenticação de Usuário"

        #campos vazios
        click_button 'Entrar'
        loginVazio = find('#UserName-error')
        senhaVazia = find('#Password-error')
        expect(loginVazio).to have_content 'Informe o usuário.'
        expect(senhaVazia).to have_content 'Informe a senha.'

        #campo senha vazio
        fill_in 'UserName', with: 'marcio12345'
        click_button 'Entrar'
        expect(senhaVazia).to have_content 'Informe a senha.'
        
        #usuário errado com senha
        fill_in 'Password', with: '123456'
        click_button 'Entrar'

        # msg = page.driver.browser.switch_to.alert.text
        selecionandoOK = find('.btn-danger', text: 'OK')
        selecionandoOK.click
        #click_on.botaoOk
        #usario certo com senha errada
        fill_in 'UserName', with: 'marcio123'
        fill_in 'Password', with: '123'
        click_button 'Entrar'
       
        selecionandoOK.click


        #usario certo com senha certa
        fill_in 'UserName', with: 'marcio123'
        fill_in 'Password', with: '123456'

        click_button 'Entrar'

        #selecionando a unidade no dropdown
        # dropdownUnidade = find('.form-control')
        # dropdownUnidade.find('option', text: 'Piatã - BA').select_option
        select('Piatã - BA', from: 'selectUnidade')
        expect(page.title).to eql "Inspeções"

    end
end