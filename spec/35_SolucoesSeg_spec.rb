describe "Soluções de Segurança", :soluC do

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
        visit '/SolucoesSeguranca'
        expect(page.title).to eql 'Soluções de Segurança'

        click_on 'Adicionar'
        click_button 'Salvar'

        erroModelo = find('#Modelo-error')
        erroAno = find('#AnoFabricacao-error')
        erroOrigem = find('#Origem-error')
        erroSolucao = find('#Solucao-error')

        expect(erroModelo).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroAno).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroOrigem).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroSolucao).to have_content 'Campo de preenchimento obrigatório.'

        fill_in 'Modelo', with: 'Modelo criado pelo Capybara'
        click_button 'Salvar'
        expect(erroAno).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroOrigem).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroSolucao).to have_content 'Campo de preenchimento obrigatório.'

        fill_in 'AnoFabricacao', with: '2025'
        click_button 'Salvar'
        expect(erroOrigem).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroSolucao).to have_content 'Campo de preenchimento obrigatório.'

        fill_in 'Origem', with: 'Ruby'
        click_button 'Salvar'
        expect(erroSolucao).to have_content 'Campo de preenchimento obrigatório.'

        fill_in 'Solucao', with: 'Criar uma automação completa pelo ruby'
        click_button 'Salvar'

    end
end