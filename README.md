# HTTParty + Rspec + Rake

Projeto de exemplo para implementação de testes para API's Rest utilizando o HTTParty + Rspec + Rake

## Ferramentas utilizadas:
- [VSCode](https://code.visualstudio.com/ "VSCode")
- [HTTParty](https://github.com/jnunemaker/httparty "HTTParty")
- [Rspec](https://github.com/rspec/rspec "Rspec")
- [Rake](https://github.com/ruby/rake "Rake")

## Recursos utilizados no projeto
- **Rspec**
	- describe
	- it
	- expect
- **Httparty**
	- get
	- post
- **Rake**
    - Task

## Estrutura de pastas

```
📦httparty_rspec
 ┣ 📂reports
 ┃ ┗ 📜rspec_results.html
 ┣ 📂spec
 ┃ ┣ 📜books_test.rb
 ┃ ┗ 📜spec_helper.rb
 ┣ 📜.rspec
 ┣ 📜Gemfile
 ┣ 📜Gemfile.lock
 ┣ 📜README.md
 ┗ 📜Rakefile
```
## Tutorial, Instalação e execução

`bundle install`

`rake spec`