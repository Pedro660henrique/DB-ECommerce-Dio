Banco de Dados Ecommerce

📌 Sobre o Projeto

Este projeto consiste no desenvolvimento de um banco de dados relacional para um sistema de e-commerce. O objetivo é fornecer uma estrutura eficiente e organizada para gerenciar clientes, pedidos, produtos, pagamentos, entregas, fornecedores e transportadoras.

🏗️ Tecnologias Utilizadas

MySQL (ou outro SGBD relacional compatível)

SQL para criação de tabelas e manipulação de dados

🗂️ Estrutura do Banco de Dados

O banco de dados é composto por diversas tabelas, organizadas conforme os principais módulos de um e-commerce:

🔹 Clientes

Cliente: Armazena informações básicas dos clientes

PessoaFisica: Clientes cadastrados como Pessoa Física (CPF)

PessoaJuridica: Clientes cadastrados como Pessoa Jurídica (CNPJ)

🔹 Produtos e Estoque

Produto: Catálogo de produtos disponíveis

Estoque: Locais onde os produtos estão armazenados

ProdutoEmEstoque: Relaciona produtos com seus respectivos estoques

TerceiroVendedor: Vendedores terceirizados

ProdutosPorVendedor: Produtos vendidos por terceiros

🔹 Pedidos e Pagamentos

Pedido: Registro de compras realizadas

RelacaoProdutoPedido: Relaciona pedidos com os produtos comprados

FormasDePagamento: Métodos de pagamento aceitos

Pagamento: Registra pagamentos efetuados

Cartoes: Detalhes de pagamentos realizados via cartão

🔹 Entregas e Logística

Entrega: Informações sobre envios e status de pedidos

Transportadora: Empresas responsáveis pela entrega dos pedidos

🔹 Fornecedores

Fornecedor: Cadastro de empresas fornecedoras

DisponibilizandoProduto: Relacionamento entre fornecedores e produtos fornecidos

🚀 Como Utilizar

📥 Importando o Banco de Dados

Clone este repositório:

git clone https://github.com/seuusuario/banco-de-dados-ecommerce.git

Acesse seu SGBD MySQL e execute o script SQL contido no projeto:

SOURCE caminho_para_o_arquivo.sql;

O banco de dados será criado e pronto para ser utilizado!

📜 Exemplo de Consultas

🔍 Listar todos os pedidos pendentes:

SELECT * FROM Pedido WHERE StatusDoPedido = 'Pendente';

🔍 Verificar os produtos disponíveis em estoque:

SELECT p.DescricaoProduto, pe.Quantidade, e.LocalEstoque
FROM Produto p
JOIN ProdutoEmEstoque pe ON p.idProduto = pe.idProduto
JOIN Estoque e ON pe.idEstoque = e.idEstoque;

📌 Próximos Passos

Implementar triggers para auditoria de alterações

Criar stored procedures para automatizar processos

Criar um script de popular o banco com dados fictícios para testes

📄 Licença

Este projeto está sob a licença MIT. Sinta-se à vontade para usar e modificar!

Desenvolvido por Pedro Henrique😊
