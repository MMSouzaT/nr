# describe "Serviços do SESI", :servE do

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
#         visit '/ServicosSesi'
#         expect(page.title).to eql 'Serviços do SESI'

#         click_on 'Adicionar'
#         click_button 'Salvar'

#         erroTitulo = find('div span', text: 'Título é obrigatório!')
#         erroDescri = find('div span', text: 'Descrição é obrigatório!')

#         expect(erroTitulo).to eql 'Título é obrigatório!'
#         expect(erroDescri).to eql 'Descrição é obrigatório!'

#         fill_in 'Titulo', with: 'Título criado pelo Capybara'
#         click_button 'Salvar'
#         expect(erroDescri).to eql 'Descrição é obrigatório!'

#         fill_in 'cke_1_contents', with: 'Descrição criada pelo Capybara'
#         click_button 'Salvar'

#     end
# end