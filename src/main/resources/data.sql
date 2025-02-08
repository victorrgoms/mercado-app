-- Limpando as tabelas e reiniciando IDs
TRUNCATE TABLE ATENDIMENTO RESTART IDENTITY CASCADE;
TRUNCATE TABLE COMPRA RESTART IDENTITY CASCADE;
TRUNCATE TABLE PRODUTO RESTART IDENTITY CASCADE;
TRUNCATE TABLE FUNCIONARIO RESTART IDENTITY CASCADE;
TRUNCATE TABLE CLIENTE RESTART IDENTITY CASCADE;
TRUNCATE TABLE MERCADO RESTART IDENTITY CASCADE;

-- Adicionando Mercados
INSERT INTO MERCADO (Tel_Merc, Nome_Merc, Hora_abertura, Ender_merc) VALUES
('11987654321', 'Mercado Central', '08:00:00', 'Rua A, 123'),
('11912345678', 'Supermercado B', '07:30:00', 'Avenida B, 456'),
('11900000000', 'Mercadinho Verde', '08:30:00', 'Rua C, 789'),
('11876543210', 'Supermercado X', '06:00:00', 'Avenida D, 321');

-- Adicionando Clientes
INSERT INTO CLIENTE (id_client, Cpf_Client, Nome_Client, Nacionalidade, Idade_Client) VALUES
(1, '123.456.789-00', 'Carlos Silva', 'Brasileiro', 30),
(2, '987.654.321-00', 'Maria Souza', 'Brasileira', 25),
(3, '111.222.333-45', 'Pedro Alves', 'Brasileiro', 40),
(4, '222.333.444-56', 'Larissa Ferreira', 'Brasileira', 28),
(5, '333.444.555-67', 'Rodrigo Lima', 'Brasileiro', 35)
ON CONFLICT (id_client) DO NOTHING;

-- Adicionando Funcionários
INSERT INTO FUNCIONARIO (Nome_Func, Cpf_Func, Tel_Func, Idade_Func) VALUES
('João Pereira', '111.222.333-44', '11987654321', 40),
('Ana Oliveira', '555.666.777-88', '11912345678', 35),
('Mariana Santos', '444.555.666-77', '11999999999', 30),
('Lucas Pereira', '888.999.000-11', '11888888888', 32),
('Fernanda Costa', '777.666.555-44', '11777777777', 29)
ON CONFLICT (Cpf_Func) DO NOTHING;

-- Adicionando Atendimentos
INSERT INTO ATENDIMENTO (Id_Merc, Id_Client, Id_Func) VALUES
(1, 1, 1), -- Mercado Central, Carlos, João
(2, 2, 2), -- Supermercado B, Maria, Ana
(3, 3, 1), -- Mercadinho Verde, Pedro, João
(4, 4, 3), -- Supermercado X, Larissa, Mariana
(1, 5, 2); -- Mercado Central, Rodrigo, Ana

-- Adicionando Produtos
INSERT INTO PRODUTO (Nome_Prod, Valor_Prod, Fornecedor, Data_Vencimento) VALUES
('Arroz', 20.00, 'Fornecedor X', '2025-12-31'),
('Feijão', 10.00, 'Fornecedor Y', '2025-10-30'),
('Macarrão', 5.00, 'Fornecedor Z', '2025-11-30'),
('Óleo de Soja', 8.50, 'Fornecedor Y', '2025-09-15'),
('Açúcar', 3.20, 'Fornecedor X', '2025-10-10'),
('Sal', 2.00, 'Fornecedor W', '2025-12-31');

-- Adicionando Compras
INSERT INTO COMPRA (Id_Atend, Id_Prod, Valor_Total, Forma_Pagam, Quant_Prod, Ender_Entrega) VALUES
(1, 1, 40.00, 'Cartão de Crédito', 2, 'Rua A, 123'), -- Carlos compra Arroz
(2, 2, 20.00, 'Dinheiro', 2, 'Avenida B, 456'), -- Maria compra Feijão
(3, 3, 10.00, 'Cartão de Débito', 2, 'Rua C, 789'), -- Pedro compra Macarrão
(4, 4, 17.00, 'Dinheiro', 2, 'Avenida D, 321'), -- Larissa compra Óleo de Soja
(5, 5, 6.40, 'Cartão de Crédito', 2, 'Rua A, 123'); -- Rodrigo compra Açúcar

-- Atualizando dados
UPDATE CLIENTE SET Idade_Client = 31 WHERE Cpf_Client = '123.456.789-00';
UPDATE FUNCIONARIO SET Tel_Func = '11955555555' WHERE Cpf_Func = '111.222.333-44';

-- Removendo dados
DELETE FROM COMPRA WHERE Id_Compra = 1;
DELETE FROM CLIENTE WHERE Cpf_Client = '987.654.321-00';

-- Consultas avançadas
-- Listar todas as compras com detalhes do cliente e produto
SELECT c.Id_Compra, cl.Nome_Client, p.Nome_Prod, c.Valor_Total, c.Forma_Pagam
FROM COMPRA c
JOIN ATENDIMENTO a ON c.Id_Atend = a.Id_Atend
JOIN CLIENTE cl ON a.Id_Client = cl.Id_Client
JOIN PRODUTO p ON c.Id_Prod = p.Id_Prod;

-- Contar quantas compras foram feitas por cada cliente
SELECT cl.Nome_Client, COUNT(c.Id_Compra) AS Total_Compras
FROM CLIENTE cl
JOIN ATENDIMENTO a ON cl.Id_Client = a.Id_Client
JOIN COMPRA c ON a.Id_Atend = c.Id_Atend
GROUP BY cl.Nome_Client;

-- Listar os funcionários que atenderam clientes
SELECT DISTINCT f.Nome_Func
FROM FUNCIONARIO f
JOIN ATENDIMENTO a ON f.Id_Func = a.Id_Func;

-- Listar todos os produtos junto com o mercado que os vende
SELECT p.Nome_Prod, m.Nome_Merc
FROM PRODUTO p
JOIN COMPRA c ON p.Id_Prod = c.Id_Prod
JOIN ATENDIMENTO a ON c.Id_Atend = a.Id_Atend
JOIN MERCADO m ON a.Id_Merc = m.Id_Merc;

-- Listar atendimentos por funcionário
SELECT f.Nome_Func, COUNT(a.Id_Atend) AS Total_Atendimentos
FROM FUNCIONARIO f
JOIN ATENDIMENTO a ON f.Id_Func = a.Id_Func
GROUP BY f.Nome_Func;

-- Buscar produtos próximos do vencimento
SELECT * FROM PRODUTO WHERE Data_Vencimento <= CURRENT_DATE + INTERVAL '30 days';


-- Buscas substring
SELECT *
FROM MERCADO
WHERE LOWER(Nome_Merc) LIKE LOWER('%mercado%');

SELECT *
FROM FUNCIONARIO
WHERE LOWER(Nome_Func) LIKE LOWER('ana%');

SELECT *
FROM CLIENTE
WHERE LOWER(Nome_Client) LIKE LOWER('joão%');

-- Consultas usando ALL
SELECT Nome_Prod
FROM PRODUTO p
WHERE Valor_Prod > ALL (SELECT Valor_Prod FROM PRODUTO WHERE Fornecedor = 'Fornecedor_X');

--Consultas usando ANY
SELECT Nome_Func
FROM FUNCIONARIO f
WHERE Idade_Func > ANY (SELECT Idade_Client FROM CLIENTE);

--Consultas com GROUP BY e Condição no HAVING
SELECT
    c.Nome_Client,
    COUNT(comp.Id_Compra) AS Total_Compras,
    SUM(comp.Valor_Total) AS Valor_Total_Compras
FROM
    CLIENTE c
JOIN
    ATENDIMENTO a ON c.Id_Client = a.Id_Client
JOIN
    COMPRA comp ON a.Id_Atend = comp.Id_Atend
GROUP BY
    c.Nome_Client
HAVING
    SUM(comp.Valor_Total) > 2;  -- Somente clientes com valor total maior que 100

-- Consultas com crecente ou decrescente

SELECT
    Nome_Prod,
    Valor_Prod
FROM
    PRODUTO
ORDER BY
    Valor_Prod ASC; -- ou DESC




