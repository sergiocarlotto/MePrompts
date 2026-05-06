# Como Contribuir com MePrompts

## Estrutura

Cada projeto tem sua própria pasta em `projects/<nome-do-projeto>/` com até 3 arquivos:

| Arquivo | Conteúdo |
|---|---|
| `context.md` | Objetivo, público-alvo, regras de negócio |
| `interactions.md` | Como interagir com a IA neste projeto |
| `references.md` | Links, documentos, glossário |

## Frontmatter obrigatório

Todo arquivo deve iniciar com:

```yaml
---
project: nome-do-projeto
file: context | interactions | references
version: 1.0.0
updated: YYYY-MM-DD
---
```

## Versionamento

- Atualize o campo `version` e `updated` a cada alteração relevante
- Use [SemVer](https://semver.org/): `MAJOR.MINOR.PATCH`
  - `PATCH`: correção de texto, clareza
  - `MINOR`: nova informação adicionada
  - `MAJOR`: mudança estrutural ou de objetivo
- Um commit por projeto alterado — não misture mudanças de projetos diferentes

## Convenção de commits

```
<projeto>: <descrição curta no imperativo>

Exemplos:
pacs: adiciona regras de negócio do módulo de laudos
assistants-ai: atualiza instruções de interação
```

## Adicionando um novo projeto

1. Crie a pasta `projects/<nome>/`
2. Crie os arquivos necessários seguindo o frontmatter padrão
3. Referencie no `README.md`
4. Commit: `<nome>: inicializa prompts do projeto`
