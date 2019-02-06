require 'httparty'

RSpec.describe 'Validar a api de Livros' do

  #GET
  it 'Deve retornar 200 para a request valida' do
    response = HttParty.get('/books')

    expect(response.code).to eql(200)
  end

  it 'Deve retornar o content-type application/json; charset=utf-8' do
    response = HttParty.get('/books')

    expect(response.headers['content-type']).to eql('application/json; charset=utf-8')
  end

  it 'O retorno não deve ser vazio' do
    response = HttParty.get('/books')

    expect(response.parsed_response).not_to be_empty
  end

  it 'Deve retornar as tipagens de acordo com a documentação' do
    response = HttParty.get('/books')

    expect(response.parsed_response).to be_a_kind_of(Array)
    response.parsed_response.each do |item|
      expect(item).to be_a_kind_of(Object)
      expect(item["ID"]).to be_a_kind_of(Integer)
      expect(item["Title"]).to be_a_kind_of(String)
      expect(item["Description"]).to be_a_kind_of(String)
      expect(item["PageCount"]).to be_a_kind_of(Integer)
      expect(item["Excerpt"]).to be_a_kind_of(String)
      expect(item["PublishDate"]).to be_a_kind_of(String)
    end
  end

  it 'Deve retornar as tipagens de acordo com a documentação para quando consultamos um livro especifico' do
    response = HttParty.get('/books/1')

    expect(response.parsed_response).to be_a_kind_of(Object)
    expect(response["ID"]).to be_a_kind_of(Integer)
    expect(response["Title"]).to be_a_kind_of(String)
    expect(response["PageCount"]).to be_a_kind_of(Integer)
    expect(response["Excerpt"]).to be_a_kind_of(String)
    expect(response["PublishDate"]).to be_a_kind_of(String)
  end

  #POST
  it 'Deve adicionar um livro aos demais' do
    body = {
      'ID': 150,
      'Title': "Titulo Livro teste api",
      'Description': "Descrição teste api",
      'PageCount': 255,
      'Excerpt': "Resumo do livro",
      'PublishDate': "2019-02-06T20:35:21.207Z"
    }.to_json
    response = HttParty.post('/books',
                             body: body,
                             headers: {'Content-Type' => 'application/json'})

    expect(response.code).to eql(200)
    expect(response.parsed_response).to eql(JSON.parse(body))
  end
end