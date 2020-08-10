describe "Àreas da máquina", :areaE do

    before(:each) do
        @imagem = Dir.pwd + '/spec/fixtures/imagem2.png'
    end

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

        #Indo para maquinas
        pegandoLinha = find('table thead tr', text: 'Cliente exclusivo para o Capybara')
        pegandoLinha.find('.btn-success').click
        #Indo para áreas da maquina
        find('.btn-default', text: 'Áreas da Máquina').click
        #Clicando em editar.
        pegandoEdit = find('table tbody tr', text: 'Ferimento Sério')
        pegandoEdit.find('.btn-primary').click

        #esvaziando campos

        select('Selecione...', from: 'TipoAreaId')
        select('Selecione...', from: 'IdSeveridadePerigo')

        
        expect(page.title).to eql 'Editar Área da Máquina'
        click_button 'Salvar'
        #Encontrando mensagens de erro e preenchendo os campos
        erroArea = find('#TipoAreaId-error')
        expect(erroArea).to have_content 'Campo de preenchimento obrigatório.'

        select('Ferimento Sério', from: 'IdSeveridadePerigo')
        click_button 'Salvar'
        erroFrequencia = find('#IdFrequenciaPerigo-error')
        expect(erroArea).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroFrequencia).to have_content 'Campo de preenchimento obrigatório.'

        select('Raro', from: 'IdFrequenciaPerigo')
        click_button 'Salvar'
        erroPossibilidade = find('#IdPossibilidadeEvitarPerigo-error')
        expect(erroArea).to have_content 'Campo de preenchimento obrigatório.'
        expect(erroPossibilidade).to have_content 'Campo de preenchimento obrigatório.'

        select('Possível', from: 'IdPossibilidadeEvitarPerigo')
        click_button 'Salvar'
        expect(erroArea).to have_content 'Campo de preenchimento obrigatório.'

        #inserindo imagem e validando se ela foi preenchida
        attach_file("LogomarcaUpload", @imagem, make_visible: true)
        img = find('.imgArea')
        expect(img[:src]).to include 'data:image/'

        # CriandoZona
        # find('#openModalAnchorRisco').click
        # sleep 1
        # click_button 'Salvar'
        # erroDescricao = find('.validate-has-error')
        # expect(erroDescricao).to eql 'Campo obrigatório!'
        # fill_in 'Risco_Descricao', with: 'ZonaAlfaEditada'
        # click_button 'Salvar'

        select('MinhaZona', from: 'RiscosId')
        select('Frontal', from: 'TipoAreaId')

        #Finalizando Edição
        click_button 'Salvar'
        find('.btn-success', text: 'OK').click

        #excluindo áreas da máquina

        expect(page.title).to eql 'Áreas da Máquina'
        
        pegandoExclu = find('table tbody tr', text: 'Ferimento Sério')
        pegandoExclu.find('.btn-danger').click
        find('.btn-confirmar', text: 'Sim').click
        find('.btn-success', text: 'OK').click

        #voltando para maquinas
        pegandoLinha = find('div li a', text: 'Cliente exclusivo para o Capybara (Cliente exclusivo para o Capybara) em 24/07/2020')
        pegandoLinha.click

        #Excluindo maquina. 
        expect(page.title).to eql 'Máquinas'
        find('.btn-danger').click
        find('.btn-confirmar', text: 'Sim').click

        visit '/Inspecoes'
        #excluindo Inspeção
        pegandoLinha = find('table thead tr', text: 'Cliente exclusivo para o Capybara')
        pegandoLinha.find('.btn-danger').click
        find('.btn-confirmar', text: 'Sim').click
        find('.btn-success', text: 'OK').click



    end
end