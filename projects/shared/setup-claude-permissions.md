# Setup: Permissões do Claude Code

Este documento descreve como configurar o sistema de permissões do Claude Code em uma nova máquina. O processo envolve dois passos manuais obrigatórios (bloqueados por hard-block de segurança do Claude) e um passo automático via script.

## Arquivos envolvidos

Todos em `MePrompts/projects/shared/`:
- `permissions.json` — fonte canônica de todas as permissões
- `sync-claude-permissions.ps1` — script que aplica as permissões ao settings.json global
- `setup-claude-permissions.md` — este documento

## Passos para nova máquina

### 1. Criar o comando `/sync-permissions` (manual)

Criar o arquivo `~/.claude/commands/sync-permissions.md` com o conteúdo abaixo.

> **Atenção:** se o nome de usuário na nova máquina for diferente de `sergi`, ajuste o caminho do script.

```markdown
---
description: Sincroniza permissões do MePrompts para ~/.claude/settings.json
---

Execute o script de sincronização de permissões com o seguinte comando PowerShell:

` ` `powershell
powershell -ExecutionPolicy Bypass -File "C:\Users\sergi\OneDrive\Documents\GitHub\MePrompts\projects\shared\sync-claude-permissions.ps1"
` ` `

Após executar, confirme o resultado exibido no terminal.
```

### 2. Desbloquear edição do settings.json (manual)

Abrir `~/.claude/settings.json` e adicionar ao array `permissions.allow`:

```json
"Edit(C:\\Users\\sergi\\.claude\\settings.json)"
```

> Se o nome de usuário for diferente de `sergi`, ajustar o caminho.

### 3. Sincronizar as permissões (automático)

Com os dois passos acima concluídos, invocar o comando `/sync-permissions` no Claude Code. O script irá:
- Ler `permissions.json` e aplicar ao `~/.claude/settings.json`
- Adaptar automaticamente caminhos do usuário original (`C:\Users\sergi` e `//c/Users/sergi`) para o usuário atual da nova máquina
- Limpar permissões duplicadas em `~/.claude/settings.local.json`
- Exibir o diff do que foi adicionado/removido

## Manutenção

Para adicionar ou remover permissões no futuro, editar `permissions.json` e rodar `/sync-permissions`.

## Por que os passos 1 e 2 são manuais?

O Claude Code possui um hard-block incondicional que impede qualquer agente de modificar os arquivos `~/.claude/settings*.json` e `~/.claude/commands/` diretamente — nem mesmo com permissão explícita no `allow`. Isso é uma proteção de segurança do Claude Code que não pode ser contornada via instrução, skill ou permissão.
