# Design: Estrutura do MePrompts

**Data:** 2026-05-06
**Status:** Aprovado

---

## Objetivo

Repositório pessoal e versionado de prompts para uso com IA (Claude Code e outras ferramentas) em múltiplos projetos. Centraliza contexto de projetos, instruções de interação e materiais de referência do ponto de vista do usuário de IA — não do código do projeto em si.

## Escopo

- Uso pessoal (Sérgio Carlotto)
- Projetos iniciais: `pacs`, `plugin-marketplace`, `animati-ai`, `assistants-ai`, `me-prompts`
- Ferramentas-alvo: Claude Code (via `@` em CLAUDE.md) e outras (uso manual)

## Arquitetura

### Estrutura de pastas

```
MePrompts/
  projects/
    <nome-do-projeto>/
      context.md        # objetivo, regras de negócio, público-alvo
      interactions.md   # como a IA deve se comportar neste projeto
      references.md     # links, docs, glossário
  docs/
    superpowers/
      specs/            # documentos de design (este arquivo)
  CONTRIBUTING.md       # convenções de nomenclatura e commits
  README.md             # visão geral e instruções de uso por ferramenta
```

### Frontmatter padrão

Cada arquivo `.md` inicia com:

```yaml
---
project: <nome>
file: context | interactions | references
version: 1.0.0
updated: YYYY-MM-DD
---
```

Permite rastrear no histórico Git qual versão de cada prompt estava vigente em cada momento.

## Como referenciar

### Claude Code

No `CLAUDE.md` de cada projeto:

```markdown
@C:\Users\sergi\OneDrive\Documents\GitHub\MePrompts\projects\pacs\context.md
@C:\Users\sergi\OneDrive\Documents\GitHub\MePrompts\projects\pacs\interactions.md
```

### Outras ferramentas

Copiar conteúdo manualmente para o system prompt ou início da conversa. O `README.md` documenta esse fluxo.

## Versionamento

- SemVer nos arquivos (`version` no frontmatter)
- Commits atômicos por projeto: `pacs: atualiza regras de negócio do módulo de laudos`
- Tags Git opcionais para marcos: `v1.0.0`

## Decisões de design

| Decisão | Motivo |
|---|---|
| Um arquivo por tipo de conteúdo | Permite referenciar granularmente no Claude Code |
| Frontmatter YAML | Rastreabilidade de versão sem depender só do Git log |
| Commits por projeto | Histórico claro de quem mudou o quê |
| Sem automação de injeção | Mínimo viável; referência manual é suficiente para uso pessoal |
