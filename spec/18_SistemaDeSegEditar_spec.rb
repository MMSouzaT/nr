describe "Sistemas de Segurança", :sistemasE do

    it 'Editar' do

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
        visit '/DispositivosSeguranca'
        expect(page.title).to eql 'Sistemas de Segurança'

        #Editando sistema
        pegandoLinha = find('table tbody tr', text: '00 - Criado pelo Capybara')
        pegandoLinha.find('.btn-primary').click


        #esvaziando campos
        select('Selecione...', from: 'IdTipoSistemadeSeguranca')
        fill_in 'Descricao', with: ''
        click_button 'Salvar'

        #encontrando mensagens de erro
        erroTipo = find('#IdTipoSistemadeSeguranca-error')
        erroDescrição = find('#Descricao-error')

        expect(erroTipo).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroDescrição).to have_content 'Campo de preenchimento obrigatório.'

        #preenchendo campos
        select('Documentação', from: 'IdTipoSistemadeSeguranca')
        click_button 'Salvar'
        expect(erroDescrição).to have_content 'Campo de preenchimento obrigatório.'

        fill_in 'Descricao', with: '00 - Editado pelo Capybara'
        click_button 'Salvar'

        find('.btn-success', text: 'OK').click

        expect(page.title).to eql 'Sistemas de Segurança'

        #Excluindo o Sistema
        pegandoLinha = find('table tbody tr', text: '00 - Editado pelo Capybara')
        pegandoLinha.find('.btn-danger').click
        find('.btn-confirmar', text: 'Sim').click
        find('.btn-success', text: 'OK').click

    end

end