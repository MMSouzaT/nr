describe "Marcas", :marcasE do

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
        visit '/Marcas'
        expect(page.title).to eql 'Marcas'

        #editando marca

        pegandoLinha = find('table tbody tr', text: '00 - Marca criada pelo Capybara')
        pegandoLinha.find('.btn-primary').click
        #esvaziando campo
        fill_in 'Descricao', with: ''
        click_button 'Salvar'
        
        erroDescri = find('div span', text: 'Descrição é obrigatório!')
        expect(erroDescri).to have_content 'Descrição é obrigatório!'


        fill_in 'Descricao', with: '00 - Marca editada pelo Capybara'
        click_button 'Salvar'
        find('.btn-success', text: 'OK').click

        #excluindo

        pegandoLinha = find('table tbody tr', text: '00 - Marca editada pelo Capybara')
        pegandoLinha.find('.btn-danger').click
        find('.btn-confirmar', text: 'Sim').click
        find('.btn-success', text: 'OK').click



    end
end