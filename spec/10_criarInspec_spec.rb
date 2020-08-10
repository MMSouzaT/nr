describe "Inspeções", :inspecoesC do

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

        
        click_on 'Adicionar'
        click_button 'Salvar'

        erroData = find('#Data-error')
        erroCliente = find('#ClienteMatrizId-error')
        expect(erroData).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroCliente).to have_content 'Campo de preenchimento obrigatório.'

        fill_in 'Data', with: '24/07/2020'
        click_button 'Salvar'

        expect(erroCliente).to have_content 'Campo de preenchimento obrigatório.'
        select('Cliente exclusivo para o Capybara', from: 'ClienteMatrizId')
        sleep 1
        click_button 'Salvar'
        erroFilial = find('#FilialMatrizId-error')
        expect(erroFilial).to have_content 'Campo de preenchimento obrigatório.'

        select('Cliente exclusivo para o Capybara', from: 'FilialMatrizId')
        click_button 'Salvar'

        find('.blue', text: 'OK').click

        click_on 'Adicionar'
        erroNome = find('#IntegrantesGrupoGestor_Nome-error')
        erroEmpresa = find('#IntegrantesGrupoGestor_Empresa-error')
        erroCargo = find('#IntegrantesGrupoGestor_Cargo-error')

        expect(erroNome).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroEmpresa).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroCargo).to have_content 'Campo de preenchimento obrigatório.'

        fill_in 'IntegrantesGrupoGestor_Nome', with: 'Márcio'
        click_on 'Adicionar'
        expect(erroEmpresa).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroCargo).to have_content 'Campo de preenchimento obrigatório.'

        fill_in 'IntegrantesGrupoGestor_Empresa', with: 'Ternarius'
        click_on 'Adicionar'
        expect(erroCargo).to have_content 'Campo de preenchimento obrigatório.'

        fill_in 'IntegrantesGrupoGestor_Cargo', with: 'Diretor'
        click_on 'Adicionar'

        click_button 'Salvar'

    end
end