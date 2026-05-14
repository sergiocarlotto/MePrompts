# Setup: Permissoes do Claude Code

Este documento descreve como configurar e manter as permissoes do Claude Code nos computadores usados com o `MePrompts`.

## Perfis de maquina

Use estes nomes para distinguir configuracoes por computador:

| Perfil | Significado | Uso esperado |
|---|---|---|
| `pessoal` | Computador atual usado como origem da configuracao | Fonte inicial das permissoes e caminhos observados |
| `profissional` | Outro computador onde este ambiente sera replicado | Destino do bootstrap e das adaptacoes de caminho |

Quando uma configuracao valer para os dois computadores, trate como `comum`.

Quando uma configuracao depender de usuario, caminho local, login, VPN, token, OAuth, extensao instalada ou politica da maquina, marque mentalmente como especifica do perfil (`pessoal` ou `profissional`) e adapte antes de aplicar.

## Regra principal

As permissoes do Claude Code devem ser mantidas no arquivo global do usuario:

```text
~/.claude/settings.json
```

Nao grave novas permissoes em `.claude/settings.local.json` de projetos. Se existir alguma permissao local antiga, o script de sincronizacao tenta limpar duplicidades do arquivo global.

## Arquivos envolvidos

Todos em `MePrompts/projects/shared/`:

- `permissions.json`: fonte canonica das permissoes comuns
- `sync-claude-permissions.ps1`: script que aplica as permissoes ao `~/.claude/settings.json`
- `setup-claude-permissions.md`: este documento

## O que e comum

Estas configuracoes sao esperadas tanto no computador `pessoal` quanto no `profissional`:

- Usar `permissions.json` como fonte canonica
- Rodar `/sync-permissions` para aplicar permissoes
- Manter permissoes no `~/.claude/settings.json`
- Evitar permissoes locais em `.claude/settings.local.json`
- Recriar autenticacoes por login/OAuth, sem copiar credenciais

## O que e especifico do perfil pessoal

No computador `pessoal`, os caminhos atuais podem aparecer como:

```text
C:\Users\sergi\OneDrive\Documents\GitHub\MePrompts
//c/Users/sergi/OneDrive/Documents/GitHub
C:\Users\sergi\.claude\settings.json
```

Esses caminhos representam a maquina de origem. Eles podem continuar em `permissions.json`, porque o script adapta os caminhos para o usuario atual ao aplicar as permissoes.

## O que deve ser adaptado no perfil profissional

No computador `profissional`, ajuste ou confirme:

- Nome do usuario Windows
- Caminho local do `MePrompts`
- Caminho local dos repositorios GitHub/GitLab
- Presenca do Claude Code no PATH
- Login do Claude Code
- MCP Jira/Atlassian e OAuth
- Regras corporativas de VPN, proxy, antivirus ou bloqueio de scripts

Nao copie arquivos sensiveis entre maquinas, como:

- `~/.claude/.credentials.json`
- tokens
- refresh tokens
- cookies
- client secrets
- chaves privadas

## Passos para configurar uma nova maquina profissional

### 1. Clonar ou atualizar o MePrompts

Garanta que o repo `MePrompts` exista na maquina `profissional`.

Exemplo de caminho esperado:

```text
C:\Users\<usuario>\OneDrive\Documents\GitHub\MePrompts
```

Se o caminho for diferente, use o caminho real nos passos seguintes.

### 2. Criar o comando `/sync-permissions` manualmente

Crie o arquivo:

```text
~/.claude/commands/sync-permissions.md
```

Com este conteudo, ajustando o caminho do script para o usuario da maquina `profissional`:

````markdown
---
description: Sincroniza permissoes do MePrompts para ~/.claude/settings.json
---

Execute o script de sincronizacao de permissoes com o seguinte comando PowerShell:

```powershell
powershell -ExecutionPolicy Bypass -File "C:\Users\<usuario>\OneDrive\Documents\GitHub\MePrompts\projects\shared\sync-claude-permissions.ps1"
```

Apos executar, confirme o resultado exibido no terminal.
````

### 3. Desbloquear edicao do settings.json manualmente

Abra:

```text
~/.claude/settings.json
```

E adicione ao array `permissions.allow`, ajustando o usuario da maquina `profissional`:

```json
"Edit(C:\\Users\\<usuario>\\.claude\\settings.json)"
```

Este passo e manual porque o Claude Code pode bloquear alteracoes diretas em `~/.claude/settings*.json`.

### 4. Sincronizar as permissoes

Com os passos manuais concluidos, invoque no Claude Code:

```text
/sync-permissions
```

O script ira:

- Ler `permissions.json`
- Adaptar automaticamente caminhos do perfil `pessoal` (`C:\Users\sergi` e `//c/Users/sergi`) para o usuario atual
- Aplicar as permissoes ao `~/.claude/settings.json`
- Limpar permissoes duplicadas em `~/.claude/settings.local.json`, quando existir
- Exibir o diff do que foi adicionado/removido

## Como registrar novas permissoes

Quando uma nova permissao for necessaria:

1. Decida se ela e `comum`, `pessoal` ou `profissional`.
2. Se for comum, adicione em `permissions.json`.
3. Se for especifica de uma maquina, documente aqui antes de aplicar.
4. Rode `/sync-permissions`.
5. Verifique o diff exibido pelo script.

## Criterio para distinguir comum, pessoal e profissional

Use esta regra:

- `comum`: permissao necessaria nos dois computadores para o fluxo padrao
- `pessoal`: permissao que so faz sentido nesta maquina de origem
- `profissional`: permissao exigida por caminho, politica, ferramenta ou acesso especifico da maquina de destino

Exemplos:

- `mcp__Jira__getJiraIssue`: comum, se Jira for usado nos dois ambientes
- `Read(//c/Users/sergi/OneDrive/Documents/GitHub/**)`: comum na intencao, mas o caminho e do perfil pessoal e sera adaptado pelo script
- Permissao para um caminho fora do OneDrive do computador profissional: especifica do perfil profissional e deve ser documentada antes de aplicar

## Por que alguns passos sao manuais?

O Claude Code possui bloqueios de seguranca que podem impedir agentes de modificar diretamente:

- `~/.claude/settings*.json`
- `~/.claude/commands/`

Mesmo com permissao explicita no `allow`, esses arquivos podem exigir intervencao manual. Por isso, o fluxo separa:

- passos manuais de bootstrap
- sincronizacao automatica das permissoes comuns
- adaptacoes especificas por perfil de maquina
