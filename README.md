# 📚 SG-Biblio: Biblioteca Comunitária Leitura Livre

> Projeto acadêmico de Banco de Dados Relacional desenvolvido para a disciplina de Análise e Desenvolvimento de Sistemas.

## 📝 Sobre o Projeto
O **SG-Biblio** é um sistema de banco de dados para gerenciar as operações da biblioteca comunitária fictícia "Leitura Livre".

O projeto abrange desde a modelagem conceitual até a implementação física, utilizando SQL para criar tabelas normalizadas, inserir dados e realizar manipulações complexas de registros.

## 🛠️ Tecnologias Utilizadas
* **SGBD:** MariaDB / MySQL (via XAMPP)
* **Interface de Gerenciamento:** phpMyAdmin
* **Linguagem:** SQL (DDL e DML)
* **Controle de Versão:** Git e GitHub

## 🗂️ Arquivos do Repositório

Este repositório contém os scripts SQL exportados do phpMyAdmin:

1.  **`leitura_livre.sql`**
    * Este é o arquivo principal.
    * Contém a estrutura completa do banco de dados (DDL - `CREATE TABLE`).
    * Contém a carga inicial de dados (DML - `INSERT INTO`) para Autores, Obras, Editoras, Usuários e Exemplares.

2.  **`leitura_livre-UPDATES.sql`**
    * Contém os scripts de manipulação de dados realizados na atividade prática.
    * Inclui as alterações de estado do banco (ex: atualizações na tabela `exemplar` e registros de empréstimos modificados).

## 🚀 Como Executar (Usando XAMPP)

Para testar este projeto em sua máquina local:

### Passo 1: Preparar o Ambiente
1.  Inicie o **XAMPP Control Panel**.
2.  Dê "Start" nos módulos **Apache** e **MySQL**.
3.  Clique no botão **Admin** do MySQL para abrir o **phpMyAdmin** no navegador.

### Passo 2: Importar o Banco de Dados
1.  No phpMyAdmin, crie um novo banco de dados chamado `leitura_livre`.
2.  Selecione este banco na lateral esquerda.
3.  Vá na aba **Importar** (Import).
4.  Clique em "Escolher Arquivo" e selecione o arquivo **`leitura_livre.sql`** deste repositório.
5.  Clique em **Executar** (Go).
    * *Isso criará toda a estrutura e populá-la com os dados iniciais.*

### Passo 3: Executar Manipulações
1.  Para aplicar as atualizações ou verificar as queries de manipulação, você pode importar ou abrir o arquivo **`leitura_livre-UPDATES.sql`** na aba **SQL** do phpMyAdmin e executá-lo.

## 🔍 Estrutura do Banco
O banco segue a 3ª Forma Normal (3FN) e contém as seguintes tabelas principais:
* **`obra`**: Cadastro dos livros.
* **`exemplar`**: Controle físico dos livros.
* **`emprestimo`**: Registro de circulação de livros.
* **`usuario`**: Cadastro de leitores.
* **`autoria`**: Tabela associativa para relação N:N entre Obras e Autores.
