

DROP TABLE IF EXISTS Consumos;
DROP TABLE IF EXISTS Cardapios;
DROP TABLE IF EXISTS Refeicoes;
DROP TABLE IF EXISTS Estudantes;

CREATE TABLE Estudantes (
    id_estudante INTEGER PRIMARY KEY AUTOINCREMENT,
    nome         TEXT NOT NULL,
    matricula    TEXT NOT NULL UNIQUE,
    curso        TEXT NOT NULL,
    email        TEXT,
    bolsista     INTEGER NOT NULL DEFAULT 0 CHECK (bolsista IN (0, 1))
);

CREATE TABLE Refeicoes (
    id_refeicao  INTEGER PRIMARY KEY AUTOINCREMENT,
    nome         TEXT NOT NULL,
    tipo         TEXT NOT NULL CHECK (tipo IN ('Café da manhã', 'Almoço', 'Jantar')),
    horario      TEXT NOT NULL,
    preco        REAL NOT NULL CHECK (preco >= 0)
);

CREATE TABLE Cardapios (
    id_cardapio  INTEGER PRIMARY KEY AUTOINCREMENT,
    id_refeicao  INTEGER NOT NULL,
    data         TEXT NOT NULL,
    prato_principal TEXT NOT NULL,
    acompanhamento  TEXT NOT NULL,
    sobremesa       TEXT,
    calorias        INTEGER,
    FOREIGN KEY (id_refeicao) REFERENCES Refeicoes (id_refeicao)
);

CREATE TABLE Consumos (
    id_consumo   INTEGER PRIMARY KEY AUTOINCREMENT,
    id_estudante INTEGER NOT NULL,
    id_cardapio  INTEGER NOT NULL,
    data_consumo TEXT NOT NULL,
    valor_pago   REAL NOT NULL CHECK (valor_pago >= 0),
    FOREIGN KEY (id_estudante) REFERENCES Estudantes (id_estudante),
    FOREIGN KEY (id_cardapio)  REFERENCES Cardapios (id_cardapio)
);


INSERT INTO Estudantes (nome, matricula, curso, email, bolsista) VALUES
('Ana Beatriz Souza',     '2023001', 'Engenharia Civil',        'ana.souza@univ.edu.br',     1),
('Bruno Carvalho Lima',   '2023002', 'Ciência da Computação',   'bruno.lima@univ.edu.br',    0),
('Camila Ferreira',       '2022015', 'Medicina',                'camila.ferreira@univ.edu.br', 0),
('Daniel Oliveira Santos','2024003', 'Direito',                 'daniel.santos@univ.edu.br', 1),
('Eduarda Martins',       '2021027', 'Nutrição',                'eduarda.martins@univ.edu.br', 0),
('Felipe Rocha',          '2023018', 'Administração',           'felipe.rocha@univ.edu.br',  1),
('Gabriela Alves',        '2022031', 'Psicologia',              'gabriela.alves@univ.edu.br', 0),
('Henrique Pereira',      '2024009', 'Engenharia Elétrica',     'henrique.pereira@univ.edu.br', 1),
('Isabela Costa',         '2021044', 'Arquitetura e Urbanismo', 'isabela.costa@univ.edu.br', 0),
('João Pedro Mendes',     '2023040', 'Biologia',                'joao.mendes@univ.edu.br',   0);


INSERT INTO Refeicoes (nome, tipo, horario, preco) VALUES
('Café Simples',           'Café da manhã', '07:00', 2.00),
('Café Completo',          'Café da manhã', '07:00', 3.50),
('Almoço Tradicional',     'Almoço',        '11:00', 5.00),
('Almoço Vegetariano',     'Almoço',        '11:00', 5.00),
('Almoço Executivo',       'Almoço',        '11:30', 8.00),
('Almoço Fit',             'Almoço',        '11:30', 7.00),
('Jantar Tradicional',     'Jantar',        '18:00', 5.00),
('Jantar Vegetariano',     'Jantar',        '18:00', 5.00),
('Jantar Leve',            'Jantar',        '18:30', 4.00),
('Jantar Executivo',       'Jantar',        '18:30', 8.00);


INSERT INTO Cardapios (id_refeicao, data, prato_principal, acompanhamento, sobremesa, calorias) VALUES
(1,  '2025-03-03', 'Pão com margarina',        'Café com leite',           'Banana',            280),
(2,  '2025-03-03', 'Pão com ovos mexidos',     'Suco de laranja e frutas', 'Iogurte',           450),
(3,  '2025-03-03', 'Frango grelhado',          'Arroz, feijão e salada',   'Gelatina',          720),
(4,  '2025-03-04', 'Strogonoff de soja',       'Arroz integral e legumes', 'Laranja',           650),
(5,  '2025-03-04', 'Bife acebolado',           'Arroz, feijão e purê',     'Pudim',             850),
(6,  '2025-03-05', 'Filé de peixe assado',     'Quinoa e brócolis',        'Salada de frutas',  580),
(7,  '2025-03-05', 'Carne moída com legumes',  'Arroz, feijão e salada',   'Melancia',          700),
(8,  '2025-03-06', 'Omelete de legumes',       'Arroz e salada verde',     'Maçã',              540),
(9,  '2025-03-06', 'Sopa de legumes',          'Torradas',                 'Mamão',             380),
(10, '2025-03-07', 'Lasanha de frango',        'Salada caprese',           'Mousse de maracujá', 820);


INSERT INTO Consumos (id_estudante, id_cardapio, data_consumo, valor_pago) VALUES
(1,  3,  '2025-03-03', 5.00),
(2,  3,  '2025-03-03', 5.00),
(3,  2,  '2025-03-03', 3.50),
(4,  4,  '2025-03-04', 5.00),
(5,  6,  '2025-03-05', 7.00),
(6,  5,  '2025-03-04', 8.00),
(7,  8,  '2025-03-06', 5.00),
(8,  7,  '2025-03-05', 5.00),
(9,  9,  '2025-03-06', 4.00),
(10, 10, '2025-03-07', 8.00);
