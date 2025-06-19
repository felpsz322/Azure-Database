IF NOT EXISTS(
    SELECT * FROM sysobjects 
    WHERE name = 'Clientes' AND xtype = 'U'
)
BEGIN
  CREATE TABLE Clientes (
        cliente_id INT PRIMARY KEY IDENTITY(1,1),
        nome NVARCHAR(100) NOT NULL,
        email NVARCHAR(100) NOT NULL,
        telefone NVARCHAR(20)
    );
END;

IF NOT EXISTS (
    SELECT * FROM sysobjects 
    WHERE name = 'Tecnicos' 
    AND xtype = 'U'
)
BEGIN
    CREATE TABLE Tecnicos (
        tecnico_id INT PRIMARY KEY IDENTITY(1,1),
        nome NVARCHAR(100) NOT NULL,
        especialidade NVARCHAR(100)
    );
END;

IF NOT EXISTS (
    SELECT * FROM sysobjects 
    WHERE name = 'Categorias' 
    AND xtype = 'U'
)
BEGIN
    CREATE TABLE Categorias (
        categoria_id INT PRIMARY KEY IDENTITY(1,1),
        nome NVARCHAR(50) NOT NULL
    );
END;

IF NOT EXISTS (
    SELECT * FROM sysobjects 
    WHERE name = 'Chamados' 
    AND xtype = 'U'
)
BEGIN
    CREATE TABLE Chamados (
        chamado_id INT PRIMARY KEY IDENTITY(1,1),
        titulo NVARCHAR(200) NOT NULL,
        descricao NVARCHAR(MAX) NOT NULL,
        status NVARCHAR(20) NOT NULL,
        data_abertura DATE NOT NULL,
        data_fechamento DATE,
        cliente_id INT NOT NULL,
        tecnico_id INT,
        categoria_id INT NOT NULL,
        FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id),
        FOREIGN KEY (tecnico_id) REFERENCES Tecnicos(tecnico_id),
        FOREIGN KEY (categoria_id) REFERENCES Categorias(categoria_id)
    );
END;

IF NOT EXISTS (
    SELECT * FROM sysobjects 
    WHERE name = 'Historico' 
    AND xtype = 'U'
)
BEGIN
    CREATE TABLE Historico (
        historico_id INT PRIMARY KEY IDENTITY(1,1),
        chamado_id INT NOT NULL,
        data DATETIME NOT NULL,
        comentario NVARCHAR(MAX) NOT NULL,
        FOREIGN KEY (chamado_id) REFERENCES Chamados(chamado_id)
    );
END;

INSERT INTO
    Clientes (nome, email, telefone)
VALUES 
    ('João da Silva', 'joaosil@gmail.com', '11999998888'),
    ('Ana Ferreira', 'anaferreira@gmail.com', '11888888888'),
    ('Lucas Gomes', 'lucasgomes@gmail.com', '11777777777'),
    ('Maria Souza', 'mariasouza@gmail.com', '11888888899'),
    ('Luana de Carvalho', 'luanacarv@gmail.com', '11777772588'),
    ('Felipe Andrade', 'felipeandrade@gmail.com', '11222222222'),
    ('Bruna Silva', 'brunasilva@gmail.com', '11822223333'),
    ('Carlos Henrique', 'carloshenrique@gmail.com', '11712345678'),
    ('Mariana Costa', 'marianacosta@gmail.com', '11666666666'),
    ('Eduardo Lima', 'eduardolima@gmail.com', '11598765432');


INSERT INTO
    Tecnicos (nome, especialidade)
VALUES 
    ('jessica', 'Desenvolvimento de Software'),
    ('Felipe', 'Banco de Dados'),
    ('Gabriela', 'Redes'),
    ('Ana Paula', 'Segurança da Informação'),
    ('Vitor', 'Suporte em Hardware');

INSERT INTO 
    Categorias (nome)
VALUES 
    ('Redes'),
    ('Hardware'),
    ('Software'),
    ('Banco de Dados'),
    ('Segurança da Informação');

INSERT INTO 
    Chamados (titulo, descricao, status, data_abertura, cliente_id, tecnico_id, categoria_id)
VALUES 
    ('Sem conexão', 'Cliente relata que está sem internet', 'Aberto', GETDATE(), 1, 1, 1),
    ('Computador não liga', 'Ao apertar o botão, nada acontece.', 'Aberto', GETDATE(), 1, 1, 1),
    ('Erro ao abrir sistema', 'Sistema ERP apresenta erro 500.', 'Em andamento', GETDATE(), 2, 2, 2),
    ('Sem internet', 'Usuário sem conexão desde ontem.', 'Aberto', GETDATE(), 3, 3, 3),
    ('Backup falhou', 'Backup automático não foi concluído.', 'Fechado', GETDATE(), 4, 4, 4),
    ('Senha vazada', 'Suspeita de vazamento de senha.', 'Aberto', GETDATE(), 5, 5, 5),
    ('Computador lento', 'Máquina demora mais de 10 minutos para ligar.', 'Em andamento', GETDATE(), 1, 2, 1),
    ('Erro de login', 'Usuário não consegue acessar o sistema.', 'Fechado', GETDATE(), 2, 1, 2),
    ('Conexão VPN instável', 'VPN cai a cada 10 minutos.', 'Aberto', GETDATE(), 3, 4, 3),
    ('Falha no banco de dados', 'Erro de conexão com o SQL Server.', 'Em andamento', GETDATE(), 4, 3, 4),
    ('Antivírus vencido', 'O antivírus do computador expirou.', 'Fechado', GETDATE(), 5, 5, 5);

INSERT INTO
    Historico
VALUES
    (1, '2025-06-01 09:00', 'Chamado aberto pelo cliente.'),
  (1, '2025-06-01 10:30', 'Equipamento será recolhido para análise.'),

  (2, '2025-06-02 08:45', 'Erro replicado pelo suporte.'),
  (2, '2025-06-02 11:00', 'Encaminhado para equipe de desenvolvimento.'),

  (3, '2025-06-03 10:00', 'Verificado roteador do cliente.'),
  (3, '2025-06-03 11:00', 'Troca de cabo de rede realizada.'),

  (4, '2025-05-28 14:20', 'Backup falhou por falta de espaço.'),
  (4, '2025-05-29 09:00', 'Espaço liberado e backup refeito com sucesso.'),

  (5, '2025-06-04 15:00', 'Senha alterada preventivamente.'),
  (5, '2025-06-04 16:00', 'Solicitado relatório de acessos.'),

  (6, '2025-06-05 09:30', 'Realizada limpeza de arquivos temporários.'),
  (6, '2025-06-05 10:45', 'Análise de uso de memória em andamento.'),

  (7, '2025-06-01 10:00', 'Redefinida senha do usuário.'),
  (7, '2025-06-02 08:00', 'Acesso confirmado, problema resolvido.'),

  (8, '2025-06-06 08:30', 'Verificação de estabilidade da VPN iniciada.'),
  (8, '2025-06-06 10:00', 'Troca de servidor sugerida.'),

  (9, '2025-06-06 11:00', 'Erro SQL identificado em logs.'),
  (9, '2025-06-06 13:00', 'Restart do serviço do banco agendado.'),

  (10, '2025-06-01 09:00', 'Licença do antivírus expirada há 5 dias.'),
  (10, '2025-06-03 10:00', 'Licença renovada e proteção reativada.');



SELECT * FROM Chamados WHERE status = 'Aberto';

SELECT * FROM Historico WHERE chamado_id = 1;

SELECT tecnico_id, COUNT(*) AS total FROM Chamados GROUP BY tecnico_id;
