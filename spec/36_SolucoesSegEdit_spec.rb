describe "Soluções de Segurança", :soluE do

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

        pegandoElemento = find('div ul li div div div', text: 'Modelo criado pelo Capybara')
        pegandoElemento.find('.btn-primary').click

        fill_in 'Modelo', with: ''
        fill_in 'AnoFabricacao', with: ''
        fill_in 'Origem', with: ''
        fill_in 'Solucao', with: ''

        click_button 'Salvar'

        erroModelo = find('#Modelo-error')
        erroAno = find('AnoFabricacao-error')
        erroOrigem = find('#Origem-error')
        erroSolucao = find('#Solucao-error')

        expect(erroModelo).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroAno).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroOrigem).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroSolucao).to have_content 'Campo de preenchimento obrigatório.'

        fill_in 'Modelo', with: 'Modelo editado pelo Capybara'
        click_button 'Salvar'
        expect(erroAno).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroOrigem).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroSolucao).to have_content 'Campo de preenchimento obrigatório.'

        fill_in 'AnoFabricacao', with: '2024'
        click_button 'Salvar'
        expect(erroOrigem).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroSolucao).to have_content 'Campo de preenchimento obrigatório.'

        fill_in 'Origem', with: 'RubyEdit'
        click_button 'Salvar'
        expect(erroSolucao).to have_content 'Campo de preenchimento obrigatório.'

        fill_in 'Solucao', with: 'Editar uma automação completa pelo ruby'
        click_button 'Salvar'

        pegandoElemento = find('div ul li div div div', text: 'Modelo editado pelo Capybara')
        pegandoElemento.find('.btn-danger').click
        click_button 'Excluir'


    end
end