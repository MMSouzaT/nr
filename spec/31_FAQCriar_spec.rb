describe "FAQ", :faqC do

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
        visit '/FAQs'
        expect(page.title).to eql 'FAQ'

        click_on 'Adicionar'
        click_button 'Salvar'

        erroPergunta = find('.text-danger', text: 'Pergunta é obrigatório!')
        erroResposta = find('.text-danger', text: 'Resposta é obrigatório!')

        expect(erroPergunta).to have_content 'Pergunta é obrigatório!'
        expect(erroResposta).to have_content 'Resposta é obrigatório!'

        fill_in 'Pergunta', with: '00 - Pergunta criada pelo Capybara'
        fill_in 'Resposta', with: '00 - Resposta criada pelo Capybara'
        click_button 'Salvar'
        #find('.btn-success', text: 'OK').click        

    end
end