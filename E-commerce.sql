CREATE TABLE Fornecedor (
    idFornecedor INT PRIMARY KEY AUTO_INCREMENT,
    RazaoSocial VARCHAR(50) NOT NULL,
    CNPJ VARCHAR(18) NOT NULL UNIQUE
);

CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Identificacao VARCHAR(50) NOT NULL,
    Endereco VARCHAR(100) NOT NULL
);

CREATE TABLE Pedido (
    idPedido INT PRIMARY KEY AUTO_INCREMENT,
    StatusDoPedido ENUM('Pendente', 'Processando', 'Enviado', 'Entregue', 'Cancelado') DEFAULT 'Pendente',
    DescricaoPedido VARCHAR(255),
    idCliente INT NOT NULL,
    Frete DECIMAL(10,2),
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE Produto (
    idProduto INT PRIMARY KEY AUTO_INCREMENT,
    Categoria VARCHAR(50) NOT NULL,
    DescricaoProduto VARCHAR(100) NOT NULL,
    Valor DECIMAL(10,2) NOT NULL
);

CREATE TABLE Estoque (
    idEstoque INT PRIMARY KEY AUTO_INCREMENT,
    LocalEstoque VARCHAR(100) NOT NULL
);

CREATE TABLE DisponibilizandoProduto (
    idFornecedor INT NOT NULL,
    idProduto INT NOT NULL,
    PRIMARY KEY (idFornecedor, idProduto),
    FOREIGN KEY (idFornecedor) REFERENCES Fornecedor(idFornecedor),
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);

CREATE TABLE ProdutoEmEstoque (
    idProduto INT NOT NULL,
    idEstoque INT NOT NULL,
    Quantidade INT NOT NULL CHECK (Quantidade >= 0),
    PRIMARY KEY (idProduto, idEstoque),
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto),
    FOREIGN KEY (idEstoque) REFERENCES Estoque(idEstoque)
);

CREATE TABLE RelacaoProdutoPedido (
    idProduto INT NOT NULL,
    idPedido INT NOT NULL,
    Quantidade INT NOT NULL CHECK (Quantidade > 0),
    PRIMARY KEY (idProduto, idPedido),
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto),
    FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido)
);

CREATE TABLE TerceiroVendedor (
    idTerceiroVendedor INT PRIMARY KEY AUTO_INCREMENT,
    RazaoSocial VARCHAR(50) NOT NULL,
    LocalVendedor VARCHAR(100)
);

CREATE TABLE ProdutosPorVendedor (
    idTerceiroVendedor INT NOT NULL,
    idProduto INT NOT NULL,
    Quantidade INT NOT NULL CHECK (Quantidade >= 0),
    PRIMARY KEY (idTerceiroVendedor, idProduto),
    FOREIGN KEY (idTerceiroVendedor) REFERENCES TerceiroVendedor(idTerceiroVendedor),
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);

CREATE TABLE PessoaFisica (
    idCliente INT PRIMARY KEY,
    CPF CHAR(11) NOT NULL UNIQUE, 
    DataNascimento DATE NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE PessoaJuridica (
    idCliente INT PRIMARY KEY,
    RazaoSocial VARCHAR(50) NOT NULL,
    CNPJ VARCHAR(18) NOT NULL UNIQUE, 
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE FormasDePagamento (
    idFormaPagamento INT PRIMARY KEY AUTO_INCREMENT,
    descricao ENUM('Cartao', 'Pix', 'Boleto', 'Dinheiro') NOT NULL
);

CREATE TABLE Pagamento (
    idPagamento INT PRIMARY KEY AUTO_INCREMENT,
    valor DECIMAL(10,2) NOT NULL CHECK (valor > 0),
    dataPagamento DATETIME DEFAULT CURRENT_TIMESTAMP,
    idFormaPagamento INT NOT NULL,
    FOREIGN KEY (idFormaPagamento) REFERENCES FormasDePagamento(idFormaPagamento)
);

CREATE TABLE Cartoes (
    idPagamento INT PRIMARY KEY,
    tipo ENUM('Debito', 'Credito') NOT NULL,
    nomeTitular VARCHAR(50) NOT NULL,
    numeroCartao CHAR(16) NOT NULL, 
    validade CHAR(5) NOT NULL,
    cvv CHAR(3) NOT NULL,
    FOREIGN KEY (idPagamento) REFERENCES Pagamento(idPagamento)
);

CREATE TABLE Transportadora (
    idTransportadora INT PRIMARY KEY AUTO_INCREMENT,
    nomeTransportadora VARCHAR(50) NOT NULL
);

CREATE TABLE Entrega (
    idEntrega INT PRIMARY KEY AUTO_INCREMENT,
    idPedido INT NOT NULL,
    idCliente INT NOT NULL,
    idTransportadora INT DEFAULT NULL,
    enderecoEntrega VARCHAR(200) NOT NULL,
    statusEntrega ENUM('Pendente', 'Em Transporte', 'Entregue', 'Cancelado') DEFAULT 'Pendente',
    dataPrevista DATE NOT NULL,
    dataEntrega DATE DEFAULT NULL,
    FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido),
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idTransportadora) REFERENCES Transportadora(idTransportadora)
);
