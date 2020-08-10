# describe "Perguntas", :perguntasE do

#     it 'Editar' do

#         #Bloco de Login
#         visit "/Account/Login?ReturnUrl=%2F"
#         fill_in 'UserName', with: 'marcio123'
#         fill_in 'Password', with: '123456'
#         click_button 'Entrar'
#         select('Piatã - BA', from: 'selectUnidade') # dessa forma ele é melhor para dropdown
#         # dropdownUnidade = find('.form-control')
#         # dropdownUnidade.find('option', text: 'Piatã - BA').select_option
#         expect(page.title).to eql "Inspeções"

#         #Indo para Sistemas 
#         visit '/Perguntas'
#         expect(page.title).to eql 'Perguntas'
#         pegandoLinha = find('table tbody tr', text: '00 - Tipo criado pelo Capybara')
#         pegandoLinha.find('.btn-primary').click


#         click_button 'Salvar'

#         erroEnum = find('#Enunciado-error')
#         erroitensId = find('#ItensId-error')

#         expect(erroEnum).to have_content 'Campo de preenchimento obrigatório.'
#         expect(erroitensId).to have_content 'Campo de preenchimento obrigatório.'

#         fill_in 'Enunciado', with: '00 - Enunciado criado pelo Capybara'
#         click_button 'Salvar'
#         expect(erroitensId).to have_content 'Campo de preenchimento obrigatório.'

#         select('A função parada de emergência deve estar disponível e operacional a qualquer tempo, independentemente do modo de operação. ', from: 'ItensId')
#         click_button 'Salvar'
#         find('.btn-success', text: 'OK').click
#     end
# end