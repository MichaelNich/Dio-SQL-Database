-- Criação do banco de dados para a oficina mecânica
CREATE DATABASE oficina_mecanica;

-- Usar o banco de dados recém-criado
USE oficina_mecanica;

-- Tabela Cliente
CREATE TABLE Cliente (
    cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    telefone VARCHAR(20),
    endereco TEXT
);

-- Tabela Veiculo
CREATE TABLE Veiculo (
    veiculo_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    ano INT NOT NULL,
    placa VARCHAR(10) UNIQUE NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id)
);

-- Tabela Servico
CREATE TABLE Servico (
    servico_id INT PRIMARY KEY AUTO_INCREMENT,
    descricao TEXT NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
);

-- Tabela OrdemServico
CREATE TABLE OrdemServico (
    ordem_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    veiculo_id INT,
    data_inicio DATETIME NOT NULL,
    data_conclusao DATETIME,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id),
    FOREIGN KEY (veiculo_id) REFERENCES Veiculo(veiculo_id)
);

-- Tabela ItemServico (Relação entre Servico e OrdemServico)
CREATE TABLE ItemServico (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    ordem_id INT,
    servico_id INT,
    FOREIGN KEY (ordem_id) REFERENCES OrdemServico(ordem_id),
    FOREIGN KEY (servico_id) REFERENCES Servico(servico_id)
);

-- Tabela Peca
CREATE TABLE Peca (
    peca_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    quantidade_estoque INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL
);

-- Tabela ItemPeca (Relação entre Peca e OrdemServico)
CREATE TABLE ItemPeca (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    ordem_id INT,
    peca_id INT,
    quantidade_utilizada INT NOT NULL,
    FOREIGN KEY (ordem_id) REFERENCES OrdemServico(ordem_id),
    FOREIGN KEY (peca_id) REFERENCES Peca(peca_id)
);

-- Tabela Orcamento
CREATE TABLE Orcamento (
    orcamento_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    data_orcamento DATETIME NOT NULL,
    data_validade DATETIME NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id)
);

-- Tabela ItemOrcamento (Relação entre Servico e Orcamento)
CREATE TABLE ItemOrcamento (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    orcamento_id INT,
    servico_id INT,
    quantidade INT NOT NULL,
    FOREIGN KEY (orcamento_id) REFERENCES Orcamento(orcamento_id),
    FOREIGN KEY (servico_id) REFERENCES Servico(servico_id)
);

-- Tabela TabelaReferenciaPrecoServico
CREATE TABLE TabelaReferenciaPrecoServico (
    tabela_id INT PRIMARY KEY AUTO_INCREMENT,
    servico_id INT,
    preco_referencia DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (servico_id) REFERENCES Servico(servico_id)
);
