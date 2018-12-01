require 'httparty'

RSpec.describe 'Validar a api de usuários' do
  it 'Deve retornar 200 para a request valida' do
    response = HttParty.get('/users')
    expect(response.code).to eql(200)
  end

  it 'O retorno não deve ser vazio' do
    response = HttParty.get('/users')
    expect(response.parsed_response).not_to be_empty
  end

  it 'Deve retornar acima de 1 usuário e abaixo de 11 usuário' do
    response = HttParty.get('/users')
    expect(response.count).to be < 11
    expect(response.count).to be > 1
  end

  it 'Deve retornar as tipagens de acordo com a documentação' do
    # id: integer; name: String; username: String; email: String; address Object; phone: String; website: String; company: Object
    response = HttParty.get('/users')
    response.parsed_response.each do |item|
      expect(item["id"]).to be_a_kind_of(Integer)
      expect(item["name"]).to be_a_kind_of(String)
      expect(item["username"]).to be_a_kind_of(String)
      expect(item["email"]).to be_a_kind_of(String)
      expect(item["address"]).to be_a_kind_of(Object)
      expect(item["phone"]).to be_a_kind_of(String)
      expect(item["website"]).to be_a_kind_of(String)
      expect(item["company"]).to be_a_kind_of(Object)
    end
  end
end