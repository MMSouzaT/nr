describe "Maquina", :maquinaE do

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

        
        pegandoLinha = find('table thead tr', text: 'Cliente exclusivo para o Capybara')
        pegandoLinha.find('.btn-success').click

        find('.btn-primary').click
        #Limpando campos
        fill_in 'Nome', with: ''
        fill_in 'Descricao', with: ''
        fill_in 'Modelo', with: ''
        fill_in 'Capacidade', with: ''
        fill_in 'localizacaoPlanta', with: ''
        fill_in 'Quantidade', with: ''
        select('Selecione...', from: 'IdNumPessoasExpostasRisco')
        select('Selecione...', from: 'FrequenciaExposicaoId')
        all('.btn-danger').sample.click
        find('.btn-confirmarCustom', text: 'Sim').click
        find('.btn-danger').click
        find('.btn-confirmarCustom', text: 'Sim').click

        click_button 'Salvar'

        erroNome = find('#Nome-error')
        erroDescricao = find('#Descricao-error')
        erroModelo = find('#Modelo-error')
        erroCapacidade = find('#Capacidade-error')
        erroLocaliza = find('#localizacaoPlanta-error')
        erroQuantidade = find('#Quantidade-error')
        erroNumPesRisco = find('#IdNumPessoasExpostasRisco-error')
        erroFrequencia = find('#FrequenciaExposicaoId-error')

        expect(erroNome).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroDescricao).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroModelo).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroCapacidade).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroLocaliza).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroQuantidade).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroNumPesRisco).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroFrequencia).to have_content 'Campo de preenchimento obrigatório.'

        #adicionar marca
        find('#openModalAnchorMarca').click
        sleep 1
        click_button 'Salvar'
        # erroDescriMarca = find('.validade-has-error')
        # expect(erroDescriMarca).to have_content 'Campo obrigatório!'
        fill_in 'Marca_Descricao', with: 'Capybara'
        click_button 'Salvar'

        #preenchimento dos campos
        fill_in 'Nome', with: 'Maquina criada pelo Capybara'
        click_button 'Salvar'
        expect(erroDescricao).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroModelo).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroCapacidade).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroLocaliza).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroQuantidade).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroNumPesRisco).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroFrequencia).to have_content 'Campo de preenchimento obrigatório.'

        fill_in 'Descricao', with: 'Descrição feita pelo Capybara'
        click_button 'Salvar'
        expect(erroModelo).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroCapacidade).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroLocaliza).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroQuantidade).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroNumPesRisco).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroFrequencia).to have_content 'Campo de preenchimento obrigatório.'

        fill_in 'Modelo', with: '2020'
        click_button 'Salvar'
        expect(erroCapacidade).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroLocaliza).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroQuantidade).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroNumPesRisco).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroFrequencia).to have_content 'Campo de preenchimento obrigatório.'

        fill_in 'Capacidade', with: '30'
        click_button 'Salvar'
        expect(erroLocaliza).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroQuantidade).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroNumPesRisco).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroFrequencia).to have_content 'Campo de preenchimento obrigatório.'

        fill_in 'localizacaoPlanta', with: 'Norte'
        click_button 'Salvar'
        expect(erroQuantidade).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroNumPesRisco).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroFrequencia).to have_content 'Campo de preenchimento obrigatório.'

        fill_in 'Quantidade', with: '3'
        click_button 'Salvar'
        expect(erroNumPesRisco).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroFrequencia).to have_content 'Campo de preenchimento obrigatório.'

        select('1-2 pessoas', from: 'IdNumPessoasExpostasRisco')
        click_button 'Salvar'
        expect(erroFrequencia).to have_content 'Campo de preenchimento obrigatório.'

        select('Anualmente', from: 'FrequenciaExposicaoId')
        click_button 'Salvar'

        find('.btn-danger', text: 'OK').click

        #adicionar tipo
        find('#openModalAnchorMaquina').click
        sleep 1
        click_button 'Salvar'
        # erroDescriTipo = find('.validade-has-error')
        # expect(erroDescriTipo).to have_content 'Campo obrigatório!'
        fill_in 'MaquinaTipo_Descricao', with: 'CapyType'
        click_button 'Salvar'
        sleep 1
        click_on 'Adicionar'

        select('omg', from: 'SubTipoId')
        click_on 'Adicionar'
        click_button 'Salvar'

        find('.btn-success', text: 'OK').click

        expect(page.title).to eql 'Máquinas'

    end
end