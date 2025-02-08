CREATE TABLE IF NOT EXISTS MERCADO (
    Id_Merc SERIAL PRIMARY KEY,
    Tel_Merc VARCHAR(15),
    Nome_Merc VARCHAR(100) NOT NULL,
    Hora_abertura TIME,
    Ender_merc VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS CLIENTE (
    Id_Client SERIAL PRIMARY KEY,
    Cpf_Client VARCHAR(14) UNIQUE NOT NULL,
    Nome_Client VARCHAR(100) NOT NULL,
    Nacionalidade VARCHAR(50),
    Idade_Client INT
);

CREATE TABLE IF NOT EXISTS FUNCIONARIO (
    Id_Func SERIAL PRIMARY KEY,
    Nome_Func VARCHAR(100) NOT NULL,
    Cpf_Func VARCHAR(14) UNIQUE NOT NULL,
    Tel_Func VARCHAR(15),
    Idade_Func INT
);

CREATE TABLE IF NOT EXISTS ATENDIMENTO (
    Id_Atend SERIAL PRIMARY KEY,
    Id_Merc INT REFERENCES MERCADO(Id_Merc) ON DELETE CASCADE,
    Id_Client INT REFERENCES CLIENTE(Id_Client) ON DELETE CASCADE,
    Id_Func INT REFERENCES FUNCIONARIO(Id_Func) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS PRODUTO (
    Id_Prod SERIAL PRIMARY KEY,
    Nome_Prod VARCHAR(100) NOT NULL,
    Valor_Prod DECIMAL(10,2) NOT NULL,
    Fornecedor VARCHAR(100),
    Data_Vencimento DATE
);

CREATE TABLE IF NOT EXISTS COMPRA (
    Id_Compra SERIAL PRIMARY KEY,
    Id_Atend INT REFERENCES ATENDIMENTO(Id_Atend) ON DELETE CASCADE,
    Id_Prod INT REFERENCES PRODUTO(Id_Prod) ON DELETE CASCADE,
    Valor_Total DECIMAL(10,2) NOT NULL,
    Forma_Pagam VARCHAR(50) NOT NULL,
    Quant_Prod INT,
    Ender_Entrega VARCHAR(255)
);

-- Criação da Tabela de Histórico
CREATE TABLE IF NOT EXISTS HISTORICO_COMPRA (
    Id_Historico SERIAL PRIMARY KEY,
    Id_Compra INT,
    Valor_Total DECIMAL(10, 2),
    Forma_Pagam VARCHAR(50),
    Data_Ocorrencia TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Operacao VARCHAR(10)  -- 'INSERT', 'UPDATE', ou 'DELETE'
);

-- Criar Função do Gatilho
--CREATE OR REPLACE FUNCTION funcao_historico_compra()
--RETURNS TRIGGER AS $$
--BEGIN
--    IF TG_OP = 'INSERT' THEN
--        INSERT INTO HISTORICO_COMPRA (Id_Compra, Valor_Total, Forma_Pagam, Operacao)
--        VALUES (NEW.Id_Compra, NEW.Valor_Total, NEW.Forma_Pagam, 'INSERT');
--        RETURN NEW;
--
--    ELSIF TG_OP = 'UPDATE' THEN
--        INSERT INTO HISTORICO_COMPRA (Id_Compra, Valor_Total, Forma_Pagam, Operacao)
--        VALUES (NEW.Id_Compra, NEW.Valor_Total, NEW.Forma_Pagam, 'UPDATE');
--        RETURN NEW;
--
--    ELSIF TG_OP = 'DELETE' THEN
--        INSERT INTO HISTORICO_COMPRA (Id_Compra, Valor_Total, Forma_Pagam, Operacao)
--        VALUES (OLD.Id_Compra, OLD.Valor_Total, OLD.Forma_Pagam, 'DELETE');
--        RETURN OLD;
--    END IF;
--    RETURN NULL;  -- Garantir que a função sempre retorne algo.
--END;
--$$ LANGUAGE plpgsql;

-- Criar Gatilho
--CREATE TRIGGER trg_historico_compra
--AFTER INSERT OR UPDATE OR DELETE ON COMPRA
--FOR EACH ROW
--EXECUTE FUNCTION funcao_historico_compra();
