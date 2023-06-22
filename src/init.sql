CREATE TABLE Dono (
    id INT PRIMARY KEY,
    nome VARCHAR(50),
    sobrenome VARCHAR(50),
    numero_celular VARCHAR(15)
);

CREATE TABLE Pet (
    id INT PRIMARY KEY,
    nome VARCHAR(50),
    especie VARCHAR(50),
    raca VARCHAR(50),
    idade INT,
    id_dono INT,
    FOREIGN KEY (id_dono) REFERENCES Dono(id)
);

CREATE TABLE Agendamento (
    id BIGSERIAL PRIMARY KEY,
    datahora TIMESTAMP,
    id_pet INT,
    id_usuario INT,
    obs VARCHAR(255),
    valor_total DECIMAL(10,2)
);

CREATE TABLE Cliente (
    id_cliente BIGSERIAL PRIMARY KEY,
    nome VARCHAR(120),
    cpf VARCHAR(20),
    email VARCHAR(120),
    ativo BOOLEAN
);

CREATE TABLE Servico (
    id BIGSERIAL PRIMARY KEY,
    descricao VARCHAR(60),
    valor NUMERIC(10,2)
);

CREATE TABLE Usuario (
    id BIGSERIAL PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    senha VARCHAR(50) NOT NULL,
    ativo BOOLEAN
);

CREATE TABLE Estado (
    codigo BIGSERIAL PRIMARY KEY,
    nome VARCHAR(120),
    sigla VARCHAR(2)
);

CREATE TABLE AgendamentoServico (
    id BIGSERIAL PRIMARY KEY,
    id_servico INT,
    id_agendamento BIGINT,
    valor_unitario DECIMAL(10,2),
    FOREIGN KEY (id_servico) REFERENCES Servico(id),
    FOREIGN KEY (id_agendamento) REFERENCES Agendamento(id)
);

CREATE TABLE Pet_Servico (
    id_pet INT,
    id_servico INT,
    PRIMARY KEY (id_pet, id_servico),
    FOREIGN KEY (id_pet) REFERENCES Pet(id),
    FOREIGN KEY (id_servico) REFERENCES Servico(id)
);

CREATE TABLE Cidade (
    cod_ibge BIGSERIAL PRIMARY KEY,
    nome VARCHAR(120),
    cod_estado BIGINT,
    FOREIGN KEY (cod_estado) REFERENCES Estado(codigo)
);

CREATE TABLE Endereco (
    id_endereco BIGSERIAL PRIMARY KEY,
    id_cliente BIGINT,
    id_cidade BIGINT,
    logradouro VARCHAR(120),
    numero VARCHAR(10),
    bairro VARCHAR(60),
    cep VARCHAR(9),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_cidade) REFERENCES Cidade(cod_ibge)
);

CREATE TABLE Cliente_Endereco (
    id_cliente BIGINT,
    id_endereco BIGINT,
    PRIMARY KEY (id_cliente, id_endereco),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_endereco) REFERENCES Endereco(id_endereco)
);

INSERT INTO Dono VALUES 
(1, 'Mickey', 'Mouse', '123456789'),
(2, 'Donald', 'Duck', '123456789'),
(3, 'Bugs', 'Bunny', '123456789'),
(4, 'Tom', 'Cat', '123456789'),
(5, 'Jerry', 'Mouse', '123456789'),
(6, 'SpongeBob', 'SquarePants', '123456789'),
(7, 'Patrick', 'Star', '123456789'),
(8, 'Scooby', 'Doo', '123456789'),
(9, 'Garfield', '', '123456789'),
(10, 'Simba', 'Lion', '123456789');

INSERT INTO Pet VALUES
(1, 'Minnie', 'Dog', 'Poodle', 3, 1),
(2, 'Daisy', 'Duck', 'Unknown', 2, 2),
(3, 'Lola', 'Bunny', 'Unknown', 1, 3),
(4, 'Jerry', 'Mouse', 'Unknown', 2, 5),
(5, 'Gary', 'Snail', 'Unknown', 5, 6),
(6, 'Pluto', 'Dog', 'Unknown', 4, 1),
(7, 'Scooby', 'Dog', 'Great Dane', 7, 8),
(8, 'Garfield', 'Cat', 'Tabby', 6, 9),
(9, 'Nala', 'Lion', 'Unknown', 3, 10),
(10, 'Simba', 'Lion', 'Unknown', 2, 10);

INSERT INTO Agendamento (datahora, id_pet, id_usuario, obs, valor_total) VALUES
('2023-06-06 10:00:00', 1, 2, 'Agendamento 1', 150.00),
('2023-06-07 14:30:00', 3, 3, 'Agendamento 2', 230.00),
('2023-06-08 09:15:00', 5, 4, 'Agendamento 3', 80.00),
('2023-06-09 11:45:00', 7, 5, 'Agendamento 4', 200.00),
('2023-06-10 16:00:00', 9, 6, 'Agendamento 5', 100.00);

INSERT INTO Cliente (nome, cpf, email, ativo) VALUES
('João da Silva', '12345678901', 'joao@example.com', true),
('Maria Santos', '98765432101', 'maria@example.com', true),
('Alice Oliveira', '65432198701', 'alice@example.com', true),
('José Almeida', '45678912301', 'jose@example.com', true),
('Ana Pereira', '78912345601', 'ana@example.com', true);

INSERT INTO Servico (descricao, valor) VALUES
('Banho e Tosa', 50.00),
('Consulta Veterinária', 100.00),
('Vacinação', 80.00),
('Cirurgia', 500.00),
('Exames Laboratoriais', 120.00),
('Hospedagem', 70.00),
('Adestramento', 150.00),
('Acupuntura', 90.00),
('Banho Seco', 30.00),
('Corte de Unhas', 20.00);

INSERT INTO Usuario (nome, senha, ativo) VALUES
('admin', 'admin123', true),
('assistente', 'assistente123', true),
('atendente', 'atendente123', true),
('veterinario', 'veterinario123', true),
('joao', 'joao123', true),
('maria', 'maria123', false),
('alice', 'alice123', true),
('jose', 'jose123', true),
('ana', 'ana123', true);

INSERT INTO Estado (codigo, nome, sigla) VALUES
(1, 'Paraná', 'PR'),
(2, 'São Paulo', 'SP'),
(3, 'Rio de Janeiro', 'RJ'),
(4, 'Minas Gerais', 'MG'),
(5, 'Bahia', 'BA'),
(6, 'Santa Catarina', 'SC'),
(7, 'Rio Grande do Sul', 'RS'),
(8, 'Goiás', 'GO'),
(9, 'Ceará', 'CE'),
(10, 'Pernambuco', 'PE');

INSERT INTO AgendamentoServico (id_servico, id_agendamento, valor_unitario) VALUES
(1, 1, 50.00),
(2, 1, 100.00),
(3, 2, 80.00),
(4, 3, 500.00),
(5, 3, 120.00),
(6, 4, 70.00),
(7, 5, 150.00);

INSERT INTO Cidade (cod_ibge, nome, cod_estado) VALUES
(1, 'Curitiba', 1),
(2, 'São Paulo', 2),
(3, 'Rio de Janeiro', 3),
(4, 'Belo Horizonte', 4),
(5, 'Salvador', 5),
(6, 'Florianópolis', 6),
(7, 'Porto Alegre', 7);

INSERT INTO Endereco (id_endereco, id_cliente, id_cidade, logradouro, numero, bairro, cep) VALUES
(1, 1, 1, 'Rua das Margaridas', '1', 'Jardim das Flores', '11111-111'),
(2, 2, 2, 'Avenida dos Ipês', '2', 'Centro', '22222-222'),
(3, 3, 3, 'Travessa das Acácias', '3', 'Vila Esperança', '33333-333'),
(4, 4, 4, 'Praça das Rosas', '4', 'Bairro Novo', '44444-444'),
(5, 5, 5, 'Alameda dos Girassóis', '5', 'Parque das Árvores', '55555-555');

INSERT INTO Cliente_Endereco (id_cliente, id_endereco) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO Pet_Servico (id_pet, id_servico) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 1),
(4, 5),
(5, 4),
(6, 2),
(7, 6),
(8, 3),
(9, 1);