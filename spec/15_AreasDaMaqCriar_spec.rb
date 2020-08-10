describe "Àreas da máquina", :areaC do

    before(:each) do
        @imagem = Dir.pwd + '/spec/fixtures/imagem.png'
    end

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

        #Indo para maquinas
        pegandoLinha = find('table thead tr', text: 'Cliente exclusivo para o Capybara')
        pegandoLinha.find('.btn-success').click
        #Indo para áreas da maquina
        find('.btn-default', text: 'Áreas da Máquina').click
        click_on 'Adicionar'

        expect(page.title).to eql 'Nova Área da Máquina'
        click_button 'Salvar'
        sleep 1
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

        #Criar uma zona de perigo
        # find('#openModalAnchorRisco').click
        # sleep 1
        # find('.modal-footer', text: 'Salvar').click
        # erroDescricao = find('.validate-has-error')
        # expect(erroDescricao).to eql 'Campo obrigatório!'

        #fill_in 'Risco_Descricao', with: 'ZonaAlfa'
        #select('RiscosId', text: 'Salvar').click

        select('MinhaZona', from: 'RiscosId')
        select('Frontal', from: 'TipoAreaId')

        #Finalizando criação
        click_button 'Salvar'
        find('.btn-success', text: 'OK').click

    end
end