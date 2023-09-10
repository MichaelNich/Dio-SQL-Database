-- Inserir registros na tabela Cliente
INSERT INTO Cliente (nome, telefone, endereco) VALUES
    ('João da Silva', '123-456-7890', 'Rua A, 123'),
    ('Maria Santos', '987-654-3210', 'Avenida B, 456');

-- Inserir registros na tabela Veiculo
INSERT INTO Veiculo (cliente_id, marca, modelo, ano, placa) VALUES
    (1, 'Toyota', 'Corolla', 2020, 'ABC-1234'),
    (2, 'Ford', 'Focus', 2019, 'XYZ-5678');

-- Inserir registros na tabela Servico
INSERT INTO Servico (descricao, preco) VALUES
    ('Troca de óleo', 50.00),
    ('Reparo de freios', 100.00),
    ('Alinhamento e balanceamento', 80.00);

-- Inserir registros na tabela Peca
INSERT INTO Peca (nome, quantidade_estoque, preco_unitario) VALUES
    ('Filtro de óleo', 100, 5.00),
    ('Pastilhas de freio', 50, 20.00),
    ('Pneu aro 15', 30, 100.00);

-- Inserir registros na tabela Orcamento
INSERT INTO Orcamento (cliente_id, data_orcamento, data_validade) VALUES
    (1, '2023-09-15 09:00:00', '2023-09-20 17:00:00'),
    (2, '2023-09-16 10:00:00', '2023-09-22 18:00:00');

-- Inserir registros na tabela ItemOrcamento
INSERT INTO ItemOrcamento (orcamento_id, servico_id, quantidade) VALUES
    (1, 1, 2),
    (1, 2, 1),
    (2, 3, 4);

-- Inserir registros na tabela TabelaReferenciaPrecoServico
INSERT INTO TabelaReferenciaPrecoServico (servico_id, preco_referencia) VALUES
    (1, 55.00),
    (2, 110.00),
    (3, 90.00);
