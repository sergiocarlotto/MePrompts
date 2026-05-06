# MePrompts — Integração e População de Prompts

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Conectar o repositório MePrompts a cada projeto via CLAUDE.md e popular o conteúdo dos arquivos de prompt de cada projeto.

**Architecture:** Cada projeto recebe um `CLAUDE.md` com referências `@` apontando para os arquivos de prompt do MePrompts. O conteúdo dos prompts é preenchido de forma interativa com o usuário projeto a projeto.

**Tech Stack:** Markdown, Git, Claude Code (`@` imports em CLAUDE.md)

---

## Arquivos envolvidos

| Ação | Arquivo |
|---|---|
| Criar | `C:\Users\sergi\OneDrive\Documents\Gitlab Animati\pacs\CLAUDE.md` |
| Criar | `C:\Users\sergi\OneDrive\Documents\Gitlab Animati\plugin-marketplace\CLAUDE.md` |
| Criar | `C:\Users\sergi\OneDrive\Documents\Gitlab Animati\animati-ai\CLAUDE.md` |
| Criar | `C:\Users\sergi\OneDrive\Documents\GitHub\AssistantsAI\CLAUDE.md` |
| Popular | `projects/pacs/context.md` |
| Popular | `projects/pacs/interactions.md` |
| Popular | `projects/pacs/references.md` |
| Popular | `projects/plugin-marketplace/context.md` |
| Popular | `projects/plugin-marketplace/interactions.md` |
| Popular | `projects/plugin-marketplace/references.md` |
| Popular | `projects/animati-ai/context.md` |
| Popular | `projects/animati-ai/interactions.md` |
| Popular | `projects/animati-ai/references.md` |
| Popular | `projects/assistants-ai/context.md` |
| Popular | `projects/assistants-ai/interactions.md` |
| Popular | `projects/assistants-ai/references.md` |
| Popular | `projects/me-prompts/context.md` |
| Popular | `projects/me-prompts/interactions.md` |

---

### Task 1: Criar CLAUDE.md no projeto pacs

**Files:**
- Criar: `C:\Users\sergi\OneDrive\Documents\Gitlab Animati\pacs\CLAUDE.md`

- [ ] **Step 1: Criar o CLAUDE.md**

```markdown
# pacs

@C:\Users\sergi\OneDrive\Documents\GitHub\MePrompts\projects\pacs\context.md
@C:\Users\sergi\OneDrive\Documents\GitHub\MePrompts\projects\pacs\interactions.md
@C:\Users\sergi\OneDrive\Documents\GitHub\MePrompts\projects\pacs\references.md
```

- [ ] **Step 2: Commitar no repositório pacs**

```bash
cd "C:\Users\sergi\OneDrive\Documents\Gitlab Animati\pacs"
git add CLAUDE.md
git commit -m "feat: adiciona CLAUDE.md com referências ao MePrompts"
```

---

### Task 2: Criar CLAUDE.md no projeto plugin-marketplace

**Files:**
- Criar: `C:\Users\sergi\OneDrive\Documents\Gitlab Animati\plugin-marketplace\CLAUDE.md`

- [ ] **Step 1: Criar o CLAUDE.md**

```markdown
# plugin-marketplace

@C:\Users\sergi\OneDrive\Documents\GitHub\MePrompts\projects\plugin-marketplace\context.md
@C:\Users\sergi\OneDrive\Documents\GitHub\MePrompts\projects\plugin-marketplace\interactions.md
@C:\Users\sergi\OneDrive\Documents\GitHub\MePrompts\projects\plugin-marketplace\references.md
```

- [ ] **Step 2: Commitar no repositório plugin-marketplace**

```bash
cd "C:\Users\sergi\OneDrive\Documents\Gitlab Animati\plugin-marketplace"
git add CLAUDE.md
git commit -m "feat: adiciona CLAUDE.md com referências ao MePrompts"
```

---

### Task 3: Criar CLAUDE.md no projeto animati-ai

**Files:**
- Criar: `C:\Users\sergi\OneDrive\Documents\Gitlab Animati\animati-ai\CLAUDE.md`

- [ ] **Step 1: Criar o CLAUDE.md**

```markdown
# animati-ai

@C:\Users\sergi\OneDrive\Documents\GitHub\MePrompts\projects\animati-ai\context.md
@C:\Users\sergi\OneDrive\Documents\GitHub\MePrompts\projects\animati-ai\interactions.md
@C:\Users\sergi\OneDrive\Documents\GitHub\MePrompts\projects\animati-ai\references.md
```

- [ ] **Step 2: Commitar no repositório animati-ai**

```bash
cd "C:\Users\sergi\OneDrive\Documents\Gitlab Animati\animati-ai"
git add CLAUDE.md
git commit -m "feat: adiciona CLAUDE.md com referências ao MePrompts"
```

---

### Task 4: Criar CLAUDE.md no projeto AssistantsAI

**Files:**
- Criar: `C:\Users\sergi\OneDrive\Documents\GitHub\AssistantsAI\CLAUDE.md`

- [ ] **Step 1: Criar o CLAUDE.md**

```markdown
# assistants-ai

@C:\Users\sergi\OneDrive\Documents\GitHub\MePrompts\projects\assistants-ai\context.md
@C:\Users\sergi\OneDrive\Documents\GitHub\MePrompts\projects\assistants-ai\interactions.md
@C:\Users\sergi\OneDrive\Documents\GitHub\MePrompts\projects\assistants-ai\references.md
```

- [ ] **Step 2: Commitar no repositório AssistantsAI**

```bash
cd "C:\Users\sergi\OneDrive\Documents\GitHub\AssistantsAI"
git add CLAUDE.md
git commit -m "feat: adiciona CLAUDE.md com referências ao MePrompts"
```

---

### Task 5: Fazer push do MePrompts para o GitHub

**Files:**
- Repositório: `C:\Users\sergi\OneDrive\Documents\GitHub\MePrompts`

- [ ] **Step 1: Push para o GitHub**

```bash
cd "C:\Users\sergi\OneDrive\Documents\GitHub\MePrompts"
git push origin main
```

Esperado: branch `main` atualizada no GitHub com a estrutura inicial.

---

### Task 6: Popular prompts do projeto pacs

**Files:**
- Modificar: `projects/pacs/context.md`
- Modificar: `projects/pacs/interactions.md`
- Modificar: `projects/pacs/references.md`

- [ ] **Step 1: Preencher context.md** — descrever objetivo do pacs, módulos principais, público-alvo (radiologistas, clínicas) e regras de negócio relevantes para contexto de IA

- [ ] **Step 2: Preencher interactions.md** — descrever como o Claude deve agir no pacs: nível técnico esperado, tom, o que evitar, contexto de que o usuário é PO (não dev)

- [ ] **Step 3: Preencher references.md** — adicionar links para documentação, Jira, glossário de termos do domínio (PACS, DICOM, laudo, worklist, etc.)

- [ ] **Step 4: Atualizar versão e commitar**

```bash
cd "C:\Users\sergi\OneDrive\Documents\GitHub\MePrompts"
git add projects/pacs/
git commit -m "pacs: popula prompts iniciais de contexto, interação e referências"
```

---

### Task 7: Popular prompts do projeto plugin-marketplace

**Files:**
- Modificar: `projects/plugin-marketplace/context.md`
- Modificar: `projects/plugin-marketplace/interactions.md`
- Modificar: `projects/plugin-marketplace/references.md`

- [ ] **Step 1: Preencher context.md** — descrever o que é o plugin-marketplace, para quem serve e seu papel no ecossistema

- [ ] **Step 2: Preencher interactions.md** — instruções de como o Claude deve agir neste projeto

- [ ] **Step 3: Preencher references.md** — links e materiais relevantes

- [ ] **Step 4: Atualizar versão e commitar**

```bash
cd "C:\Users\sergi\OneDrive\Documents\GitHub\MePrompts"
git add projects/plugin-marketplace/
git commit -m "plugin-marketplace: popula prompts iniciais"
```

---

### Task 8: Popular prompts do projeto animati-ai

**Files:**
- Modificar: `projects/animati-ai/context.md`
- Modificar: `projects/animati-ai/interactions.md`
- Modificar: `projects/animati-ai/references.md`

- [ ] **Step 1: Preencher context.md** — objetivo do animati-ai, tecnologias envolvidas, público

- [ ] **Step 2: Preencher interactions.md** — instruções de comportamento da IA neste projeto

- [ ] **Step 3: Preencher references.md** — links e materiais de referência

- [ ] **Step 4: Atualizar versão e commitar**

```bash
cd "C:\Users\sergi\OneDrive\Documents\GitHub\MePrompts"
git add projects/animati-ai/
git commit -m "animati-ai: popula prompts iniciais"
```

---

### Task 9: Popular prompts do projeto assistants-ai

**Files:**
- Modificar: `projects/assistants-ai/context.md`
- Modificar: `projects/assistants-ai/interactions.md`
- Modificar: `projects/assistants-ai/references.md`

- [ ] **Step 1: Preencher context.md** — objetivo do AssistantsAI, tecnologias, público

- [ ] **Step 2: Preencher interactions.md** — instruções de comportamento da IA

- [ ] **Step 3: Preencher references.md** — links e materiais de referência

- [ ] **Step 4: Atualizar versão e commitar**

```bash
cd "C:\Users\sergi\OneDrive\Documents\GitHub\MePrompts"
git add projects/assistants-ai/
git commit -m "assistants-ai: popula prompts iniciais"
```

---

### Task 10: Popular prompts do me-prompts (meta)

**Files:**
- Modificar: `projects/me-prompts/context.md`
- Modificar: `projects/me-prompts/interactions.md`

- [ ] **Step 1: Preencher context.md** — descrever o que é o MePrompts, estrutura, convenções

- [ ] **Step 2: Preencher interactions.md** — como pedir ao Claude para ajudar a manter o repositório (adicionar projetos, atualizar versões, fazer commits)

- [ ] **Step 3: Atualizar versão e commitar**

```bash
cd "C:\Users\sergi\OneDrive\Documents\GitHub\MePrompts"
git add projects/me-prompts/
git commit -m "me-prompts: popula prompts meta do repositório"
```

---

### Task 11: Push final e verificação

- [ ] **Step 1: Push de todos os prompts populados**

```bash
cd "C:\Users\sergi\OneDrive\Documents\GitHub\MePrompts"
git push origin main
```

- [ ] **Step 2: Verificar referências no Claude Code**

Abra uma sessão no projeto `pacs` e confirme que o Claude carrega o contexto do MePrompts ao iniciar a conversa.
