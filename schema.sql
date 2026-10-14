create database multi_agents_mercado;
use multi_agents_mercado;

create table usuarios (
	id_usuario int primary key auto_increment,
    nome varchar(50) not null,
    email varchar(50) not null,
    senha varchar(200) not null,
    criado_em timestamp default now(),
    atualizado_em timestamp default now() on update now()
);

create table vendas (
	id_venda int primary key auto_increment,
    dia_vendido timestamp default now(),
    id_usuario int,
    constraint FK_id_usuario_vendas foreign key (id_usuario) references usuarios (id_usuario),
    atualizado_em timestamp default now() on update now()
);

create table categorias (
	id_categoria int primary key auto_increment,
    nome varchar(50) not null,
    criado_em timestamp default now(),
    atualizado_em timestamp default now() on update now()
);

create table produtos (
	id_produto int primary key auto_increment,
    id_categoria int,
    constraint FK_id_categoria_produtos foreign key (id_categoria) references categorias (id_categoria),
    criado_em timestamp default now(),
    atualizado_em timestamp default now() on update now()
);

create table vendas_produtos (
	id_venda_produto int primary key auto_increment,
    id_venda int,
    constraint FK_id_venda_vendas_produtos foreign key (id_venda) references vendas (id_venda),
    id_produto int,
    constraint FK_id_produto_vendas_produtos foreign key (id_produto) references produtos (id_produto),
    criado_em timestamp default now(),
    atualizado_em timestamp default now() on update now()
);

-- 1. USUÁRIOS: 20 registros
INSERT INTO usuarios (nome, email, senha) VALUES
('Ana Silva', 'ana.silva@example.com', 'TesteAna@2026'),
('Bruno Souza', 'bruno.souza@example.com', 'TesteBruno@2026'),
('Carla Oliveira', 'carla.oliveira@example.com', 'TesteCarla@2026'),
('Daniel Santos', 'daniel.santos@example.com', 'TesteDaniel@2026'),
('Eduarda Lima', 'eduarda.lima@example.com', 'TesteEduarda@2026'),
('Felipe Costa', 'felipe.costa@example.com', 'TesteFelipe@2026'),
('Gabriela Rocha', 'gabriela.rocha@example.com', 'TesteGabriela@2026'),
('Henrique Alves', 'henrique.alves@example.com', 'TesteHenrique@2026'),
('Isabela Martins', 'isabela.martins@example.com', 'TesteIsabela@2026'),
('João Pereira', 'joao.pereira@example.com', 'TesteJoao@2026'),
('Karina Ribeiro', 'karina.ribeiro@example.com', 'TesteKarina@2026'),
('Lucas Ferreira', 'lucas.ferreira@example.com', 'TesteLucas@2026'),
('Mariana Gomes', 'mariana.gomes@example.com', 'TesteMariana@2026'),
('Nicolas Barbosa', 'nicolas.barbosa@example.com', 'TesteNicolas@2026'),
('Olivia Cardoso', 'olivia.cardoso@example.com', 'TesteOlivia@2026'),
('Pedro Almeida', 'pedro.almeida@example.com', 'TestePedro@2026'),
('Rafaela Mendes', 'rafaela.mendes@example.com', 'TesteRafaela@2026'),
('Samuel Nunes', 'samuel.nunes@example.com', 'TesteSamuel@2026'),
('Tatiana Lopes', 'tatiana.lopes@example.com', 'TesteTatiana@2026'),
('Victor Araujo', 'victor.araujo@example.com', 'TesteVictor@2026');

-- 2. CATEGORIAS: 20 registros
INSERT INTO categorias (nome) VALUES
('Frutas'),
('Verduras'),
('Legumes'),
('Carnes bovinas'),
('Aves'),
('Peixes'),
('Laticínios'),
('Padaria'),
('Arroz e feijão'),
('Massas'),
('Enlatados'),
('Frios e embutidos'),
('Congelados'),
('Bebidas não alcoólicas'),
('Café e chá'),
('Doces e chocolates'),
('Biscoitos e salgadinhos'),
('Limpeza'),
('Higiene pessoal'),
('Utilidades domésticas');

-- 3. PRODUTOS: 20 registros
-- Cada produto está associado a uma categoria existente.
INSERT INTO produtos (id_categoria) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20);

-- 4. VENDAS: 20 registros
-- Cada venda está associada a um usuário existente.
-- O horário da venda será preenchido pelo DEFAULT da tabela.
INSERT INTO vendas (id_usuario) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20);

-- 5. VENDAS_PRODUTOS: 20 registros
-- Uma associação por venda para manter exatamente 20 registros.
-- Um mesmo produto pode aparecer em diferentes vendas.
INSERT INTO vendas_produtos (id_venda, id_produto) VALUES
(1, 9),
(2, 7),
(3, 4),
(4, 1),
(5, 18),
(6, 8),
(7, 14),
(8, 5),
(9, 10),
(10, 19),
(11, 9),
(12, 15),
(13, 7),
(14, 16),
(15, 3),
(16, 12),
(17, 17),
(18, 20),
(19, 2),
(20, 6);

COMMIT;

-- Conferência: cada tabela deve retornar 20 registros.
SELECT 'usuarios' AS tabela, COUNT(*) AS total FROM usuarios
UNION ALL
SELECT 'categorias', COUNT(*) FROM categorias
UNION ALL
SELECT 'produtos', COUNT(*) FROM produtos
UNION ALL
SELECT 'vendas', COUNT(*) FROM vendas
UNION ALL
SELECT 'vendas_produtos', COUNT(*) FROM vendas_produtos;