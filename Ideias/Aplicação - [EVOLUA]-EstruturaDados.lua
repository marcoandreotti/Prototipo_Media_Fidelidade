Estrutura - Aplicação - [EVOLUA]
Esboço da estrutura de dados para a aplicação EVOLUA, que tem como objetivo ajudar os usuários a gerenciar seus objetivos e tarefas de forma eficiente, fornecendo ferramentas para planejamento, acompanhamento e análise de progresso.

Usuario
-Id         LONG
-Nome       VARCHAR(100)
-Email      VARCHAR(150)
-Senha      VARCHAR(25)
-Ativo      BOOLEAN

Objetivo
-Id             LONG
-UsuarioId      LONG
-DataInicio     DATETIME
-DataFim        DATETIME
-AreaAtuacao    VARCHAR(150)
-Objetivo       VARCHAR(150)
-Meta           VARCHAR(255)
-Tipo           ENUM (1 = Dias, 2 = Semanas, 3 = Meses, 4 = Anos)
-Prazo          INT
-Prioridade     ENUM (1 = BAIXA, 2 = MÉDIA, 3 = ALTA)
-Status         ENUM (1 = PENDENTE, 2 = EM ANDAMENTO, 3 = CONCLUiDO, 4 = CANCELADO, 5 = ATRASADO)

Tarefa
-Id             LONG
-ObjetivoId     LONG
-Data           DATETIME
-DataConclusao  DATETIME
-Descrição      VARCHAR(255)
-Tipo           ENUM (1 = Dias, 2 = Semanas, 3 = Meses, 4 = Anos)
-Prazo          INT
-Ordem          INT 
-Peso           DECIMAL(18,2)
-Percentual     DECIMAL(18,2)
-Status         ENUM (1 = PENDENTE, 2 = EM ANDAMENTO, 3 = CONCLUiDO, 4 = CANCELADO, 5 = ATRASADO)

Evolucao
-Id         LONG
-TarefaId   LONG
-Data       DATETIME
-Percentual DECIMAL(18,2)
-Observacao VARCHAR(255)  


Usuario -> Login/Cadastro (jwt e senha criptografada)
- O usuário pode criar uma conta fornecendo um nome, email e senha.
- O sistema deve validar o email para garantir que seja único e no formato correto.
- O usuário pode fazer login usando seu email e senha.

Objetivo -> Gerenciamento de Metas
- O usuário pode criar objetivos, definindo uma meta, tipo (dias, semanas, meses, anos), prazo e prioridade.
- O sistema deve calcular a data de conclusão com base no tipo e prazo fornecidos.
- O usuário pode visualizar, editar ou excluir seus objetivos.
- O sistema não deve permitir editar um objetivo que já foi concluído ou que esteja atrasado.
- Ao criar ou editar um objetivo, o sistema deve verificar se a data de conclusão é válida (não pode ser no passado e menor que a inicial).
- O sistema deve exibir o status do objetivo (pendente, em andamento, concluídO, atrasadO) com base na data atual e na data de conclusão.

Tarefa -> Gerenciamento de Tarefas
- O usuário pode criar tarefas associadas a um objetivo, definindo uma descrição, tipo (dias, semanas, meses, anos), prazo, ordem e peso.
- O sistema deve validar se a data de criação e data de conclusão da tarefa estão dentro do prazo do objetivo associado.
- O usuário pode visualizar, editar ou excluir suas tarefas.
- O sistema deve calcular o percentual de conclusão da tarefa com base no peso e na ordem das tarefas associadas ao mesmo objetivo.
- O sistema deve exibir o status da tarefa (pendente, em andamento, concluídO, atrasadO) com base na data atual e na data de conclusão.

Evolucao -> Registro de Evolução
- O usuário pode registrar a evolução de uma tarefa, fornecendo a data, percentual de conclusão e uma observação.
- O sistema deve validar se a data de evolução está dentro do prazo da tarefa associada.
- O usuário pode visualizar o histórico de evolução de uma tarefa.
- O sistema deve calcular o percentual total de conclusão do objetivo com base nas tarefas associadas e suas evoluções.
- O sistema deve exibir o status do objetivo com base no percentual total de conclusão e na data de conclusão do objetivo.

Roadmap e Planejamento
- O usuário pode vizualizar um roadmap de seus objetivos e tarefas, organizados por data de início e data de conclusão.
- O sistema deve permitir que o usuário planeje suas tarefas, definindo a ordem de execução e ajustando os prazos conforme necessário.
- O usuário pode receber sugestões de planejamento com base em seus objetivos e tarefas, considerando prazos e prioridades.

Relatórios e Análises
- O usuário pode gerar relatórios de seus objetivos e tarefas, filtrando por status, prioridade e período.
- O sistema deve fornecer análises visuais, como gráficos de progresso e distribuição de tarefas por prioridade.
- O usuário pode exportar seus dados em formatos como CSV ou PDF.

Notificações
- O sistema deve enviar notificações para o usuário sobre prazos próximos, tarefas atrasadas e objetivos concluídos.
- O usuário pode configurar suas preferências de notificação (email, push, etc.).

Segurança
- O sistema deve implementar medidas de segurança para proteger os dados do usuário, como criptografia de senha e autenticação JWT.
- O sistema deve garantir que os usuários só possam acessar seus próprios dados e não os de outros usuários.
